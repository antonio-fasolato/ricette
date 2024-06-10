FROM amazonlinux:latest

RUN dnf install -y https://repo.almalinux.org/almalinux/9/AppStream/x86_64/os/Packages/cargo-1.75.0-1.el9.x86_64.rpm \
    https://repo.almalinux.org/almalinux/9/AppStream/x86_64/os/Packages/rust-1.75.0-1.el9.x86_64.rpm \
    https://repo.almalinux.org/almalinux/9/AppStream/x86_64/os/Packages/rust-std-static-1.75.0-1.el9.x86_64.rpm \
    https://repo.almalinux.org/almalinux/9/AppStream/x86_64/os/Packages/llvm-libs-17.0.6-5.el9.x86_64.rpm

RUN yum install -y tar gzip

WORKDIR /mdbook
RUN mkdir -p /mdbook/bin
RUN curl -sSL https://github.com/rust-lang/mdBook/releases/download/v0.4.40/mdbook-v0.4.40-x86_64-unknown-linux-gnu.tar.gz | tar -xz --directory=/mdbook/bin

RUN cargo install mdbook-indexing
ENV PATH="${PATH}:/root/.cargo/bin"
