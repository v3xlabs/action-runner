FROM ghcr.io/actions/actions-runner:2.311.0

USER root

RUN apt-get update && \
    apt-get install -y curl zip unzip git wget docker.io \
    clang-13 clang-14 clang-15 clang-format-13 clang-format-14 clang-format-15 clang-tidy-13 clang-tidy-14 clang-tidy-15 \
    openssl libssl-dev pkg-config build-essential make gcc gcc-10 gcc-11 gcc-12

USER runner

# Install Rustup
RUN bash -c "bash <(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs) --default-toolchain stable --profile minimal -y"

# Install Bun
RUN curl -fsSL https://bun.sh/install | bash

ENV PATH="${PATH}:/home/runner/.bun/bin:/home/runner/.cargo/bin"

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
    sudo apt-get install -y nodejs &&\
    sudo npm install -g yarn pnpm
