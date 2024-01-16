FROM ubuntu:22.04

RUN apt update

RUN apt install -y curl unzip git

# Install Rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > ./rustup.sh
RUN chmod +x ./rustup.sh
RUN ./rustup.sh --default-toolchain none -y

# Install Bun
RUN curl -fsSL https://bun.sh/install > ./bun.sh
RUN chmod +x ./bun.sh
RUN ./bun.sh

# Install Nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh > ./nvm.sh
RUN chmod +x ./nvm.sh
RUN ./nvm.sh
RUN bash -c "source ~/.nvm/nvm.sh && nvm install node"

# Install pnpm
RUN bash -c "source ~/.nvm/nvm.sh && npm install -g pnpm"

# Install Docker
RUN apt install -y docker.io
