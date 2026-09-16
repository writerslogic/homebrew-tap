class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.8"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.8-aarch64-apple-darwin.tar.gz"
      sha256 "1e97d84e29bfec09a11d115656fee6cd3978f053fc2d2e91bf82f89c120b5208"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.8-x86_64-apple-darwin.tar.gz"
      sha256 "247620fa27e61f23a4f26325fe28581002a05546d2de2946a511f6242d57100e"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26fd7f6e9409e64e6434af055017ed76a031064768342e8e80c170692ffc9289"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fd5d0776eda4060666be19db436b0b8e7e224161ffa63ab09dc324fd55b00dd5"
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
