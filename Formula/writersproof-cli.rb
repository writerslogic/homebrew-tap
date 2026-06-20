class WritersproofCli < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.3.1"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/writersproof-cli/releases/download/v1.3.1/writersproof-cli-v1.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "322fe22b14a46e3bc227a8efa115719d2dd2f61226ef5712187ff4e7c755cd98"
    else
      url "https://github.com/writerslogic/writersproof-cli/releases/download/v1.3.1/writersproof-cli-v1.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "cf7e962c24d9ac54f8f5fefcfe2d9b807cc5d2c0ead86b5aa96846053a2ec8fb"
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
