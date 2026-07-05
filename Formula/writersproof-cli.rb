class WritersproofCli < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.5.2"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "11859ce4f82accd04ab6b4b8aadd4db67ce97f61e1036af13dbfcd052ed4581e"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.5.2-x86_64-apple-darwin.tar.gz"
      sha256 "185a2aca10d2840a8e2209a9734e4b6ce45bcbd15fab3c17d7e12b72cfdb7e86"
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
