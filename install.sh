mkdir prog; cd prog
git clone https://github.com/5Stygian/dotfiles.git
cd dotfiles

scp -v ./.bash_profile ~/
scp -v ./.bashrc ~/
cd

source ~/.bashrc
