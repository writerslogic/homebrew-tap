class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.5"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.5-aarch64-apple-darwin.tar.gz"
      sha256 "bd89c361a0c222de2ac6bedf5a6f4377c934584fd7ac801d5a4b144e8a6a43e5"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.5-x86_64-apple-darwin.tar.gz"
      sha256 "100f54d7914be34a86d93f1cb5bb4e0ba6cded40229334ceea6fbee163f5ba9b"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b22129694d2030ba51315dc1e0446e9a733c1932b34321d28b80e61b658328f1"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d18c0c533635cfb6768bbf5e1b305f65db86e2a2d977b6ef908f612eeed45d63"
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
