.PHONY: docs

all: install run

docs:
	cd docs && make run

run:
	cargo run --release

dev:
	cargo run

pack-osx-arm:
	mkdir -p build
	cd rio && cargo bundle --target aarch64-apple-darwin --release --format osx
	cp -r ./target/aarch64-apple-darwin/release/bundle/* ./build/macos-arm64/
	zip -r ./build/macos-arm64.zip ./build/macos-arm64

pack-osx-x86:
	mkdir -p build
	cd rio && cargo bundle --target x86_64-apple-darwin --release --format osx
	cp -r ./target/x86_64-apple-darwin/release/bundle/* ./build/macos-x86/
	zip -r ./build/macos-x86.zip ./build/macos-x86

lint:
	cargo fmt -- --check --color always
	cargo clippy --all-targets --all-features -- -D warnings

test:
	make lint
	RUST_BACKTRACE=full cargo test --release

watch:
	cargo watch -- cargo run

install:
	cargo install cargo-bundle
	cargo install cargo-watch
	cargo build --release

build:
	cargo build --release
