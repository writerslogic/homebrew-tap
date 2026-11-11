class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "2.0.0"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v2.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "94f3a15d5428eaec93bb703025fba4f7e83a3f04e1aee2c6d80dabf766e94077"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v2.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "19a1eecfa3c08e1a8454003e286ab56494850b1152aaf6cbeebe9f34d3b30762"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v2.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9944124af24426ad22d9e88ec370251aac648f266ad3138f6502b14ccfcef14a"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v2.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69484f62e0b78e1b668c3b46599d9989be3594bf310bff72ba798d8704e377ea"
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
