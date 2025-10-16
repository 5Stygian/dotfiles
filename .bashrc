# This is my very own .bashrc file, but this is no ordinary .bashrc.
# You see, every function that I have defined has its own personality!
# You can even ship them if you wanted to!

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000
shopt -s histappend
shopt -s cmdhist

# auto complete command from history
export INPUTRC=~/.inputrc

# show dotfiles when running ls
alias la="ls -a"

# short for "come home"
alias ch="cd ~/"

# short for "fast cd"
# read as "f c d"
fcdArgs=([7]="py" [6]="bappdat" [5]="cpp" [4]="dfs" [3]="go" [2]="gdt" [1]="mc" [0]="web")
fcd() {
    dirDoesntExist_EM="hey dumbfuck! you know that arg you passed?\nyeah, well i don't have a FUCKING CLUE where the FUCK that is supposed to be.\nhere is a list of all the places i can take you, asshole.\n\n"
    if [ $# -eq 0 ]; then
        cd ~/coding_projects
        la
        return
    else
        case "$1" in
            py)      cd ~/coding_projects/python;                            la ;;
            bappdat) cd ~/coding_projects/GlobboxZ_Compatabilities_Datapack; la ;;
            cpp)     cd ~/coding_projects/cpp;                               la ;;
            dfs)     cd ~/coding_projects/dotfiles;                          la ;;
            go)      cd ~/coding_projects/go;                                la ;;
            gdt)     cd ~/coding_projects/godot;                             la ;;
            mc)      cd ~/coding_projects/minecraft;                         la ;;
            web)     cd ~/coding_projects/web;                               la ;;

            *)  printf "${dirDoesntExist_EM}"
                printf "%s\n" "${fcdArgs[@]}"                                   ;;
        esac
    fi
}

# short for "quick nano"
# read as "q n"
qnArgs=([1]="nrc" [0]="brc")
qn() {
    noArgs_EM="Hey bro, this foo takes args, you got any?\nDid you forget them?\nDoesn't matter, here they are anyways.\n\n"
    fileDoesntExist_EM="Hey bro, that .PLACEHOLDERrc file doesn't exist.\nWhy don't you make it exist?\nHere are the args in esac you forgot.\nDon't forget about me though, I live on line 52 if you wanna hang out some time.\n\n"
    if [ $# -eq 0 ]; then
        printf "${noArgs_EM}"
        printf "%s\n" "${qnArgs[@]}"
        return
    else
        case "$1" in
            brc) nano .bashrc                ;;
            nrc) nano .nanorc                ;;

            *)  printf "${fileDoesntExist_EM}"
                printf "%s\n" "${qnArgs[@]}" ;;
        esac
    fi
}

# short for "update dotfiles"
# read as "up d f s"
updfsArgs=([1]="push" [0]="pull")
updfs() {
    noArgs_EM="H-Hey...\nI think you forgot some args <.>\nM-Maybe you could give me some >,<\nAh! I remember! Here you go~\n*The furry creature hands you a sheet of paper. Written on it is a list of arguments you can give it*\n\n"
    wrongArg_EM="H-Hey...\nWhat do you mean by that~? O.O\n*The furry creature hands you a sheet of paper. Written on it is a list of arguments you can give it*\n\n"
    noCommitMessage_EM="H-Hey...\nWhat do you want me to tell the guys upstairs ~_~\n*The furry creature hands you a sheet of paper. Written on it is the words \"You forgot a commit message, silly!\"*\n"
    if [ $# -eq 0 ]; then
        printf "${noArgs_EM}"
        printf "%s\n" "${updfsArgs[@]}"
        return
    else
        case "$1" in
            pull)   fcd dfs
                    echo "Changed directories"
                    git pull
                    echo "git pull complete"
                    cp .nanorc ~/
                    cp .bashrc ~/
                    echo "Dotfiles copied to ~/"
                    echo "Returning home..."
                    ch                                    ;;
            push)   cp .nanorc ~/coding_projects/dotfiles
                    cp .bashrc ~/coding_projects/dotfiles
                    echo "Dotfiles copied"
                    fcd dfs
                    echo "Changed directories"
                    git add .
                    echo "Files added"
                    if [ "$2" == "" ]; then
                        printf "${noCommitMessage_EM}"
                        return
                    else
                        git commit -m "$2"
                    fi
                    echo "Commit message sent"
                    git push
                    echo "Files pushed"
                    echo "Returning home..."
                    ch                                    ;;

           *)  printf "${wrongArg_EM}"
               printf "%s\n" "${updfsArgs[@]}"            ;;
       esac
    fi
}
