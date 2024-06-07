FROM rust:1.78

# RUN apk add --no-cache curl rust cargo

WORKDIR /mdbook
RUN mkdir -p /mdbook/bin
RUN curl -sSL https://github.com/rust-lang/mdBook/releases/download/v0.4.40/mdbook-v0.4.40-x86_64-unknown-linux-gnu.tar.gz | tar -xz --directory=/mdbook/bin

RUN cargo install mdbook-indexing
ENV PATH="${PATH}:/root/.cargo/bin"

# ENTRYPOINT /mdbook/bin/mdbook
