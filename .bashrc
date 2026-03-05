#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERM=xterm-256color

alias ls='ls --color=auto'
alias la='ls -a'
alias grep='grep --color=auto'

export PS1="\n\033[1m\033[32m|―[ \033[37m\u@\h \033[32m]―――[ \033[37m\A \033[32m]―――[ \033[37m\#|\! \033[32m]―――[ \033[37m\W \033[32m] \n∟――――[\033[37m\$\033[32m] \033[0m"

updfs() {
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
