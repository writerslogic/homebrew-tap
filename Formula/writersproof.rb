class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.16"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.16-aarch64-apple-darwin.tar.gz"
      sha256 "c2a2a9593f07e4c83cbd052a5cda926b4333bd7b84c58820304f0f2ddab778ab"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.16-x86_64-apple-darwin.tar.gz"
      sha256 "e17c566caa8149171faa9247bf7b554ca5550d37e6cc95eed40ab5d45ea652f6"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d2cb14bee51a1aa9da22883222a54b2c62323ffcaae2692c4464cca993c915eb"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f173ed6ae6feee97e6ea9e70a73a3deb81dda50a26a5553a896ef4677aea8aa7"
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
