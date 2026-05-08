#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/idea.sh ]] && . ~/idea.sh

tadds() {
  ~/vns/TADDS-1.0-pc/TADDS.sh
}

export CURRENT_DIRECTORY=$(pwd)

cd $CURRENT_DIRECTORY

terminaltitle

. "$HOME/.var/app/com.vscodium.codium-insiders/data/../bin/env"
