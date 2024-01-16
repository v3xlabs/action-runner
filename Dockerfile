FROM ghcr.io/actions/actions-runner:2.311.0

USER root

RUN apt-get update && \
    apt-get install -y curl zip unzip git wget docker.io && \
    rm -rf /var/lib/apt/lists/*

USER runner

# Install Rustup
RUN bash -c "bash <(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs) --default-toolchain none -y"

# Install Bun
RUN curl -fsSL https://bun.sh/install | bash

# Install Nvm
RUN curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Install Node
RUN bash -c 'source ~/.nvm/nvm.sh && for version in stable v20 v18 v16; do nvm install $version; done'

# Install pnpm and yarn
RUN bash -c 'source ~/.nvm/nvm.sh && nvm use stable && npm install -g pnpm yarn'
