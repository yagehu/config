FROM ubuntu:21.04

RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
        bash \
        curl \
        git \
        golang \
        locales \
        neovim \
        tmux \
        zsh
RUN locale-gen en_US.UTF-8
RUN curl --location \
    https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh \
    | zsh

# Install NVM and Node.
ENV NVM_DIR /root/.nvm
RUN \
    curl -o- \
    https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install node \
    && nvm use node

WORKDIR /root

COPY . .

# zsh-autosuggestions
RUN git clone \
    https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install Vim Plug for plugin management.
RUN curl -fLo ~/.config/nvim/autoload/plug.vim \
    --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install nvim plugins.
RUN nvim +PlugInstall +quitall

CMD ["/bin/zsh"]
