#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERM=xterm-256color

alias ls='ls --color=auto'
alias la='ls -a'
alias grep='grep --color=auto'
alias larpfetch='fastfetch'

export PS1="\n\[\033[1m\033[32m\]─┬──┤ \[\033[37m\]\u@\h \[\033[32m\]├───┤ \[\033[37m\]\t \[\033[32m\]├───┤ \[\033[37m\]\#|\! \[\033[32m\]├───┤ \[\033[37m\]\w \[\033[32m\]│ \n\[\033[1m\] \[\033[1m\033[32m\]└───┤\[\033[37m\]\$\[\033[32m\]│ \[\033[0m\]"

terminaltitle() {
    readarray -t SCiPNET < ~/prog/dotfiles/bash-profile-echo.txt

    echo
    printf '%s\n' "${SCiPNET[@]}"
    echo
}

updfs() {
    if [[ $# -eq 0 ]]; then
        echo "updfs [pull|push 'COMMIT_MSG']"
        return
    fi

    case "$1" in
        push)
            if [[ "$2" == "" ]]; then
                echo "Commit message needed"
            else
                cd
                echo "copying files..."
                scp -v ~/.bash_profile ~/prog/dotfiles
                scp -v ~/.bashrc ~/prog/dotfiles
                scp -v ~/.config/fastfetch/config.jsonc ~/prog/dotfiles
                cd ~/prog/dotfiles
                git add .
                git commit -m "$2"
                git push -v
                cd
            fi
            echo "Push complete"
            ;;
        pull)
            cd ~/prog/dotfiles
            git pull -v
            scp -v ./.bash_profile ~/
            scp -v ./.bashrc ~/
            scp -v ./config.jsonc ~/.config/fastfetch/config.jsonc
            cd
            source ~/.bashrc
            echo "Pull complete"
            ;;
    esac
}

qg() {
    if [[ $# -eq 0 ]]; then
        echo "Commit mesage needed"
    else
        git add .
        git commit -m "$1"
        git push -v
    fi
}

. "$HOME/.var/app/com.vscodium.codium-insiders/data/../bin/env"
