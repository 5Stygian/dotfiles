#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/idea.sh ]] && . ~/idea.sh

export CURRENT_DIRECTORY=$(pwd)

cd $CURRENT_DIRECTORY

eval "$(thefuck --alias)"
source ~/prog/.libs/emsdk/emsdk_env.sh

clear
terminaltitle

. "$HOME/.var/app/com.vscodium.codium-insiders/data/../bin/env"
