class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.14"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.14-aarch64-apple-darwin.tar.gz"
      sha256 "9781f1e38b9e660a6c7a835a6c34fb983635d111bf909ef41548952b8f367fba"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.14-x86_64-apple-darwin.tar.gz"
      sha256 "3e049efff432641736ed1a06293ba5874af57883ab2c2e686d7cb7665679db0c"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5f08abaadf67f7ebbdc49bd6b2d4c8f23fc220974442caf46b97ee98fa1f9c6f"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c9a1f8e2ef2eeb68539837d8eb5e4bfb3369c19b09af936984aabe0f22158aa0"
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
