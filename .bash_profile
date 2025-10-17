cd ~

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f ~/.nanorc ]; then
    source ~/.nanorc
fi

#updfs pull

fastfetch
