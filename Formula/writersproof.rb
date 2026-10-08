class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.21"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.21-aarch64-apple-darwin.tar.gz"
      sha256 "133711074300463d5a78085b42d461059e5777a3c5c9277905d738e79db53e65"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.21-x86_64-apple-darwin.tar.gz"
      sha256 "c26afcf6dae753cb7121b16302c8bc5d6f4e5080929c8bd012a8743f12f3df57"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "332b8647e45a67ed08a6b3e9b6964df00b3767ec722473122238e6d7ea851ce7"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4a08c10c33c7916cf55487f26b8ec0aa2dca6c508e26a6fd28feea946be302ca"
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
