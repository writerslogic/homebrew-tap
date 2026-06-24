class WritersproofCli < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.4.0"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/writersproof-cli/releases/download/v1.4.0/writersproof-cli-v1.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "1f3afe4c6cc328e2081344058911c8231978c3387b3e7cbfa4059af589f7be69"
    else
      url "https://github.com/writerslogic/writersproof-cli/releases/download/v1.4.0/writersproof-cli-v1.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "9e1ec74bb0679c71ab7e8c6af3c52851bf5c967687ad547cd67319b17a1e7708"
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
