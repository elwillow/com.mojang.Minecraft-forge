#!/bin/sh
if [ ! -f "$XDG_DATA_HOME/forge_installed" ]; then
  confirm_forge=$(zenity --list --height=230 --width=400 --title="Install Minecraft Forge?" --column="Action" --column="Action" yes "Install Forge" no "Don't install forge, ask later" never "Don't install, don't ask again")
  if [ "$confirm_forge" = "yes" ]; then
    zenity --info --width=400 --text="Minecraft folder is\n$XDG_DATA_HOME/minecraft"
    /app/bin/minecraft-forge-installer
    date > "$XDG_DATA_HOME/forge_installed"
  fi
  if [ "$confirm_forge" = "never" ]; then
    date > "$XDG_DATA_HOME/forge_installed"
  fi
fi
exec /app/extra/minecraft-launcher/minecraft-launcher --workDir "$XDG_DATA_HOME/minecraft" "$@"