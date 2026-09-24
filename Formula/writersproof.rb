class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.13"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.13-aarch64-apple-darwin.tar.gz"
      sha256 "a778811bfef588b56122698e3ad3cd359beee76d2fd18873f6c3333a346f5cd2"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.13-x86_64-apple-darwin.tar.gz"
      sha256 "0537e4a268b9cd27bb7968d8210deb1b1cb9ee5c7a3f2b41f61fa13cf092270e"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "de2481cc4ba1b298d5ea86c476a0b138e581ba3b54a89c3484e372a36ff7345a"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f1685c957331bc14c4378be5c1934e40a4174a872f987cff527271ddb8bd3018"
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
