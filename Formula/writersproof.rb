class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "2.0.1"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v2.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "11f792adde7422c826cd637e1d8a49955b9cb6eee9a2eaf8b5751818e97605b5"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v2.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "f76008e5fe0f60446f8e0fe242cb43351621703635dd5bc6d9a78098b2f29a0c"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v2.0.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "307114b74fe8ab65d40b6be18187c578952f2f4a5afd3f742a4caa62bbb4a6d9"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v2.0.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "80bba2eafed4f5d66e0f0e6eb258b7a76d7ea65c2a5cf30447f4e716e56fc65c"
    end
  end

  def install
    bin.install "writersproof-cli"
    bin.install "writerslogic-native-messaging-host" if File.exist?("writerslogic-native-messaging-host")
  end

  def caveats
    <<~EOS
      To get started:

        1. Initialize WritersProof:
           writersproof-cli init

        2. Calibrate VDF for your machine:
           writersproof-cli calibrate

        3. Create your first checkpoint:
           writersproof-cli commit your-document.md -m "Initial draft"

      For more information, see:
        https://writerslogic.com
    EOS
  end

  test do
    assert_match "writersproof-cli", shell_output("#{bin}/writersproof-cli --version")
  end
end
