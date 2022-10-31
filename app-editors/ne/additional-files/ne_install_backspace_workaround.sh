#!/bin/sh

# This is a post-install script to make sure the workaround for the "ne"
# backspace vs delete issue is applied.

neSettingsDir="$(finddir B_USER_SETTINGS_DIRECTORY)/ne"

# Make sure ne's settings dir exists:
mkdir -p "$neSettingsDir"

# Apply workaround if not already there:
if ! grep -q 0x7f "$neSettingsDir/.keys" ; then
	echo -e "KEY 0x7f BackSpace" >> "$neSettingsDir/.keys"
fi

if ! grep -q 0x115 "$neSettingsDir/.keys" ; then
	echo -e "KEY 0x115 DeleteChar" >> "$neSettingsDir/.keys"
fi
