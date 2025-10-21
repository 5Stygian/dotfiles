install() {
    mkdir coding_projects
    cd coding_projects
    git clone https://github.com/5Stygian/dotfiles.git
    cd dotfiles
    echo "Copying dotfiles..."
    scp -v ~/coding_projects/dotfiles/.bash_profile ~
    scp -v ~/coding_projects/dotfiles/.bashrc ~
    scp -v ~/coding_projects/dotfiles/.nanorc ~
    cd ~
    echo "Sourcing..."
    source ~/.bashrc
    echo "Sourcing complete"
}
