class WritersproofCli < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.5.1"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/writersproof-cli/releases/download/v1.5.1/writersproof-cli-v1.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "4ca1ddd10237d3ba1f3ddb856573a3b6292b1944dbed8def7bf91382afa410fa"
    else
      url "https://github.com/writerslogic/writersproof-cli/releases/download/v1.5.1/writersproof-cli-v1.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "3133a0a6a2692bfd6d5e5da96467b2734d93156555403470eaefe28dc57b3260"
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
