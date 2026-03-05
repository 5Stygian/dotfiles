#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export CURRENT_DIRECTORY=$(pwd)

cd $CURRENT_DIRECTORY

echo
cat ~/prog/dotfiles/bash-profile-echo.txt
echo
