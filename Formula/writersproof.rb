class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "2.0.2"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v2.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "134644891bec762f8651c6f739005a40e4c556988aedcc2075b6f9c265c41d03"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v2.0.2-x86_64-apple-darwin.tar.gz"
      sha256 "11a5af620bdb7d1c38d691636ef93f558c7f4e0f4c1ec0fed34b2880aba5487e"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v2.0.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "52dfdfb82a1dbda3759358c8311687941994a3065f144fd577c1bddbbad0eae6"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v2.0.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7dbbf4e7c7f0498f14bfcefe1f7209755f58cc75ffed972815977bc45abfd833"
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
