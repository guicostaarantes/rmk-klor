FROM rust:1.88 AS builder

WORKDIR /in

# RUN apk add alpine-sdk clang-dev
RUN apt update
RUN apt install -y build-essential clang libclang-dev
RUN cargo install flip-link cargo-make

COPY Cargo.toml Cargo.lock Makefile.toml build.rs memory.x rust-toolchain.toml ./
COPY .cargo ./.cargo
COPY src ./src
RUN cargo build --release || true
COPY keyboard.toml vial.json ./
RUN cargo make uf2 --release

FROM alpine:3.22
COPY --from=builder /in/*.uf2 /out/
