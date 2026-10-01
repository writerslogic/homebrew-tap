class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.17"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.17-aarch64-apple-darwin.tar.gz"
      sha256 "5fd5b25bcb3057b05e42af8ed7d6bfd120f1d2ffb2d55f614434e241815bff19"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.17-x86_64-apple-darwin.tar.gz"
      sha256 "26c70880751aae7da31ecebdc0a0a078272705d270a2d6175f38a0827a49435a"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b59de1af896aaf49347ed0c0236958f89f8bd7528175ea1e15d4fff366a49ddc"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fd19f7b8e91f03b904ba9267a121f708ee670d2532eb72a0ba4dbe23af2645d5"
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
