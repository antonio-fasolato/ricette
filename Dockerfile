FROM aws/codebuild/standard:7.0

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > sh.rustup.rs
RUN chmod +x sh.rustup.rs && ./sh.rustup.rs -y

RUN mkdir -p /mdbook/bin
RUN curl -sSL https://github.com/rust-lang/mdBook/releases/download/v0.4.40/mdbook-v0.4.40-x86_64-unknown-linux-gnu.tar.gz | tar -xz --directory=/mdbook/bin

RUN /root/.cargo/bin/cargo install mdbook-indexing

ENTRYPOINT /mdbook/bin/mdbook
