class WritersproofCli < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.2.2"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/writersproof-cli/releases/download/v1.2.2/writersproof-cli-v1.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "c8867b31e107bfd8e72150b5b29ba89b91ba24f98d73d4b1d5c45170fd29f958"
    else
      url "https://github.com/writerslogic/writersproof-cli/releases/download/v1.2.2/writersproof-cli-v1.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "102fa9756ff8286e971b826d6f0db0feb1695195910f6119fd8728458f4c032a"
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
    assert_match version.to_s, shell_output("#{bin}/writersproof-cli --version")
  end
end
