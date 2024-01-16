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

ENV PATH="${PATH}:~/.bun/bin:~/.cargo/bin"
