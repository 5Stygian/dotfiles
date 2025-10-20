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

# 256 bit colors
export TERM=xterm-256color

# command prompt
# hostname | username | path from home (~/) | prompt
# commenting this out beacuse the coloring doesnt work. maybe ill ask chatgpt to help me fix this
#export PS1="\n\033[38;5;198m\h\033[0m \033[15;1;0m|\033[0m \033[38;5;164m\u\033[0m \033[15;1;0m|\033[0m \033[38;5;15m\w\033[0m \033[15;1;0m~>\033[0m \$\n"

# show dotfiles when running ls
alias la="ls -a"

# short for "come home"
alias ch="cd ~/"

# short for "fast cd"
# read as "f-c d"
fcdArgs=([7]="py" [6]="bappdat" [5]="cpp" [4]="dfs" [3]="go" [2]="gdt" [1]="mc" [0]="web")
fcd() {
    scbrchReminder_M="hey dumbfuck, just so you don't annoy me again, call this guy named \"scbrch\".\nhe can help you out with your fuckass memory problems.\n\n"
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
                printf "${scbrchReminder_M}"                                    ;;
                #printf "%s\n" "${fcdArgs[@]}"                                   ;;
        esac
    fi
}

# short for "quick nano"
# read as "q n"
qnArgs=([2]="nrc" [1]="bp" [0]="brc")
qn() {
    scbrchReminder_M="Hey bro, there's this cool guy named \"scbrch\" or something like that.\nHe can help you if you forget something.\n\n"
    noArgs_EM="Hey bro, this foo takes args, you got any?\nDid you forget them?\nDoesn't matter, here they are anyways.\n\n"
    fileDoesntExist_EM="Hey bro, that .PLACEHOLDERrc file doesn't exist.\nWhy don't you make it exist?\nHere are the args in esac you forgot.\nDon't forget about me though, I live on line 61 if you wanna hang out some time.\n\n"
    if [ $# -eq 0 ]; then
        printf "${noArgs_EM}"
        printf "${scbrchReminder_M}"
        #printf "%s\n" "${qnArgs[@]}"
        return
    else
        case "$1" in
            brc) nano .bashrc                ;;
            bp)  nano .bash_profile          ;;
            nrc) nano .nanorc                ;;

            *)  printf "${fileDoesntExist_EM}"
                printf "${scbrchReminder_M}" ;;
                #printf "%s\n" "${qnArgs[@]}" ;;
        esac
    fi
}

# short for "update dotfiles"
# read as "up d f-s"
updfsArgs=([1]="push" [0]="pull")
updfs() {
    scbrchReminder_M="H-Hey...\nTh-There's this guy I know... -_-\nHis name's \"scbrch\", and he can help you out if you forget something! UwU\nW-Wait! Not that I think you will or whatever. >.<\nI'm just throwing it out there is all! @_@\nPlease don't hate me... v_v\n\n"
    noArgs_EM="H-Hey...\nI think you forgot some args... <.>\nM-Maybe you could give me some? >,<\n\n"
    #noArgs_EM="H-Hey...\nI think you forgot some args... <.>\nM-Maybe you could give me some? >,<\nAh! I remember! Here you go~\n*The furry creature hands you a sheet of paper. Written on it is a list of arguments you can give it*\n\n"
    wrongArg_EM="H-Hey...\nOwO\nWhat do you mean by that~? O.O\n\n"
    #wrongArg_EM="H-Hey...\nOwO\nWhat do you mean by that~? O.O\n*The furry creature hands you a sheet of paper. Written on it is a list of arguments you can give it*\n\n"
    noCommitMessage_EM="H-Hey...\nWhat do you want me to tell the guys upstairs ~_~\n*The furry creature hands you a sheet of paper. Written on it are the words \"You forgot a commit message, silly!\"*\n"
    if [ $# -eq 0 ]; then
        printf "${noArgs_EM}"
        printf "${scbrchReminder_M}"
        #printf "%s\n" "${updfsArgs[@]}"
        return
    else
        case "$1" in
            pull)   fcd dfs
                    echo "Changed directories"
                    git pull
                    echo "git pull complete"
                    scp -v .nanorc ~/
                    scp -v .bashrc ~/
                    scp -v .bash_profile ~/
                    echo "Dotfiles copied to ~/"
                    echo "Returning home..."
                    ch
                    echo "Sourcing dotfiles..."
                    source ~/.nanorc
                    source ~/.bashrc
                    source ~/.bash_profile
                    echo "Pull complete"                 ;;
            push)   scp -v .nanorc ~/coding_projects/dotfiles
                    scp -v .bashrc ~/coding_projects/dotfiles
                    scp -v .bash_profile ~/coding_projects/dotfiles
                    echo "Dotfiles copied"
                    fcd dfs
                    echo "Changed directories"
                    git add .
                    echo "Files added"
                    if [ "$2" == "" ]; then
                        git restore --staged .
                        printf "${noCommitMessage_EM}"
                        return
                    else
                        git commit -m "$2"
                    fi
                    echo "Commit message sent"
                    git push
                    echo "Files pushed"
                    echo "Returning home..."
                    ch
                    echo "Push complete"                 ;;

           *)  printf "${wrongArg_EM}"
               printf "${scbrchReminder_M}"              ;;
               #printf "%s\n" "${updfsArgs[@]}"            ;;
       esac
    fi
}

# short for "quick git"
# read as "q g"
qg() {
    noArgs_EM="hey, i take an arg btw\n\n"
    noCommitMesage_EM="hey, the boss needs a note, bro\n\n"
    if [ $# -eq 0 ]; then
        printf "${noArgs_EM}"
        return
    fi
    git add .
    echo "files added"
    if [ "$1" == "" ]; then
        git restore --staged .
        printf "${noCommitMessage_EM}"
        return
    else
        git commit -m "$1"
        git push
        echo "push complete"
    fi
}



# short for "stygians custom .bashrc help"
# read as "scib arch"
scbrch() {
    sep="-"
    sep_a="|"
    indent="    "
    doubleIndent="${indent}${indent}"

    intro_M="Good day to you, sire.\nI am your servant, scbrch.\n*The servant bows*\nHow may I be of your service today?\n*The servant pauses, awaiting your response.*\nOh, you want me to present to you your grimoire?\nRight away, my lord...\n*The servant scurries off to the grand library to retrieve your grimoire. He returns post haste.*\nHere you are, my lord.*The servant hands you the book, leaving the premises shortly after.*\n\n"

    alias_M="================================ALIASES===============================\n\n"

    alias_MA=(
        "la ${sep_a} ls -a ${sep_a} lists all files, including hidden files\n"
        "ch ${sep_a} cd ~/ ${sep_a} cd to the active user directory\n"
    )

    commands_M="===============================COMMANDS===============================\n\n"

    scbrch_M="scbrch ${sep} Sytgians custom .bashrc help\n"
    scbrch_MA=(
        "list all commands and their respective arguments"
    )

    fcd_M="fcd ${sep} fast cd\n"
    fcd_MA=(
        "NOTE: la is ran on call"
        "<NONE>  ${sep} cd to the coding_projects directory"
        "py      ${sep} cd to the python directory"
        "bappdat ${sep} cd to the GlobboxZ_Compatabilities_Datapack directory"
        "cpp     ${sep} cd to the C++ directroy"
        "dfs     ${sep} cd to the dotfiles directory"
        "go      ${sep} cd to the go directroy"
        "gdt     ${sep} cd to the godot directory"
        "mc      ${sep} cd to the minecraft directory"
        "web     ${sep} cd to the web directory"
    )

    qn_M="qn ${sep} quick nano\n"
    qn_MA=(
        "brc ${sep} open .bashrc in nano"
        "bp  ${sep} open .bash_profile in nano"
        "nrc ${sep} open .nanorc in nano"
    )

    updfs_M="updfs ${sep} update dotfiles\n"
    updfs_MA=(
        "pull ${sep} pull all relevent dotfiles and copy them to ~/"
        "push ${sep} copy all relevent dotfiles and push them to github"
        "${indent}Requires a commit message to be passed as well"
    )

    qg_M="qg ${sep} quick git\n"
    qg_MA=(
        "Only use when in a git repository"
        "Requires a commit message"
    )

    ending_M="======================================================================\n"

    # intro
    printf "${intro_M}"

    # ALIASES
    printf "${alias_M}"
    printf "%s\n" "${alias_MA}"
    printf "\n"

    # COMMANDS
    printf "${commands_M}"

    ## scbrch
    printf "${scbrch_M}"
    printf "${indent}%s\n" "${scbrch_MA[@]}"
    printf "\n"

    ## fcd
    printf "${fcd_M}"
    printf "${indent}%s\n" "${fcd_MA[@]}"
    printf "\n"

    ## qn
    printf "${qn_M}"
    printf "${indent}%s\n" "${qn_MA[@]}"
    printf "\n"

    ## updfs
    printf "${updfs_M}"
    printf "${indent}%s\n" "${updfs_MA[@]}"
    printf "\n"

    ## qg
    printf "${qg_M}"
    printf "${indent}%s\n" "${qg_MA[@]}"
    printf "\n"

    # ending
    printf "${ending_M}"
}
