#!/bin/bash

sed -i 's/Icon=.*/Icon=android-studio/' $HOME/.local/share/applications/jetbrains-studio.desktop
sed -i 's/Icon=.*/Icon=intellij-idea/' $HOME/.local/share/applications/jetbrains-idea.desktop
sed -i 's/Icon=.*/Icon=clion/' $HOME/.local/share/applications/jetbrains-clion.desktop
