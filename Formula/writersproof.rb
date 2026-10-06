class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.20"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.20-aarch64-apple-darwin.tar.gz"
      sha256 "0c84152ffe43d50047bbc419cd390f09193323230a57392d3a484541a9ae6866"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.20-x86_64-apple-darwin.tar.gz"
      sha256 "e45d1308168967a5d495a5bee1909a31559f6045727e063451f67c05a9a79559"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "76534a3a6893f824e7515218ef564191e4eefeffa25f63c5d33ea614b09cb1d6"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e6826ba6fa99795bfb7f8de3558326ed783459d4b2bcee6f4caab2f08c7e0a0f"
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
