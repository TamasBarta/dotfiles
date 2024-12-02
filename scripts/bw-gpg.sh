#!/bin/bash

function gpg2bw() {
	private_keys=$(gpg --list-secret-keys --keyid-format LONG | grep sec | awk '{print $2}' | awk -F/ '{print $2}')

	if [ -z "$BW_SESSION" ]; then
		export BW_SESSION=$(bw unlock --raw)
	fi

	for key_id in $private_keys; do
		# Set your variables
		name="GPG Key for $(gpg --list-secret-keys --keyid-format LONG "$key_id" | grep uid | xargs)"
		echo "Processing $name"
		custom_type="gpg-key"
		password=$(bw list items | jq -r --arg key "$key_id" '.[] | select(.type == 2) | select(.fields[]? | select(.name == "custom-type" and .value == "gpg-key")) | select(.fields[]? | select(.name == "key-id" and .value == $key)) | .fields[] | select(.name == "gpg-password") | .value')

		if [ -z "$password" ]; then
			secret_key=$(gpg --export-secret-keys --armor "$key_id")
			password=$(bw generate -uln --length 64)
		else
			secret_key=$(echo "$password" | gpg --passphrase-fd 0 --batch --yes --export-secret-keys --armor --pinentry-mode=loopback "$key_id")
		fi
		echo "Key length: $(echo "$secret_key" | wc -c)"
		echo "Key length: $(echo "$secret_key" | base64 -d | gzip | base64 | wc -c)"

		# Check if an item with the same key-id and custom-type exists
		item_id=$(bw list items | jq -r --arg custom_type "$custom_type" --arg key_id "$key_id" \
			'.[] | select(.type == 2) | select(.fields[]? | select(.name == "custom-type" and .value == $custom_type)) | select(.fields[]? | select(.name == "key-id" and .value == $key_id)) | .id')

		notes="Auto-created secure note"

		# Conditional creation or update based on `item_id`
		if [ -z "$item_id" ]; then
			base=$(bw get template item)
		else
			base=$(bw get item "$item_id")
		fi

		# Define the JSON payload for the secure note
		json_payload=$(echo "$base" | jq --arg name "$name" \
			--arg notes "$notes" \
			--arg custom_type "$custom_type" \
			--arg key_id "$key_id" \
			--arg secret_key "$secret_key" \
			--arg gpg_password "$password" \
			'.type = 2 |
                                          .secureNote.type = 0 |
                                          .name = $name |
                                          .notes = $notes |
                                          .fields = [
                                              {"name": "custom-type", "value": $custom_type, "type": 0},
                                              {"name": "key-id", "value": $key_id, "type": 0},
                                              {"name": "secret-key", "value": $secret_key, "type": 1},
                                              {"name": "gpg-password", "value": $gpg_password, "type": 1}
                                          ]')

		# Encode the JSON payload
		encoded_payload=$(echo "$json_payload" | bw encode)

		# Conditional creation or update based on `item_id`
		if [ -z "$item_id" ]; then
			# Create a new secure note
			echo "$encoded_payload" | bw create item
		else
			# Update the existing secure note
			echo "$encoded_payload" | bw edit item "$item_id"
		fi

	done

}

function bw2gpg() {
	token=$(bw unlock --raw)
}

if [ "$1" == "gpg2bw" ]; then
	gpg2bw
elif [ "$1" == "bw2gpg" ]; then
	bw2gpg
else
	echo "Usage: bw-gpg.sh [gpg2bw|bw2gpg]"
	exit 1
fi
