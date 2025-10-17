cd ~

if [ -f ~/.bash_profile ]: then
    source ~/.bash_profile
fi

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f ~/.nanorc ]; then
    source ~/.nanorc
fi

#updfs pull

fastfetch
