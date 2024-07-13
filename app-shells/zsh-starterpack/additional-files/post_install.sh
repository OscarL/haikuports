#!sh

# For now, let's enable the plugins system-wide.

zshrc=$(finddir B_SYSTEM_SETTINGS_DIRECTORY)/zsh/zshrc
zshplugs=$(finddir B_SYSTEM_DATA_DIRECTORY)/zsh/plugins

text="
#[zsh-starterpack]-> Start of block added by ZSH StarterPack
source $zshplugs/zsh-autosuggestions.plugin.zsh
source $zshplugs/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source $zshplugs/zsh-shift-select.plugin.zsh
#<-[zsh-starterpack]
"

_marker_present=$(grep '[zsh-starterpack]' $zshrc)

if [ -n "$_marker_present" ]; then
	echo "$text" >> $zshrc
	notify --type information --group "ZSH StarterPack" --title "ZSH StarterPack" --timeout 15 "Enabled ZSH StarterPack plugins. You can edit /system/settings/zsh/zshrc if needed."
else
	notify --type information --group "ZSH StarterPack" --title "ZSH StarterPack" --timeout 15 "ZSH StarterPack plugins installed/updated. You may need to manually edit /system/settings/zsh/zshrc."
fi
