# Homebrew formula for WritersLogic CLI
# To install: brew install writerslogic/tap/writerslogic

class Writerslogic < Formula
  desc "Cryptographic authorship witnessing for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.1"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/witnessd/releases/download/v1.0.1/writerslogic-v1.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "e993ea6f85d9b5b54954f92ce34cb063cf329d965d98bac52c0c698dbfcf7bf8"
    else
      url "https://github.com/writerslogic/witnessd/releases/download/v1.0.1/writerslogic-v1.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "9571087e5099e20edeaab5957168cb3fcab70c4c99a40985467298b9c9fc5a1c"
    end
  end

  def install
    bin.install "cpop"
    bin.install "writerslogic-native-messaging-host" if File.exist?("writerslogic-native-messaging-host")
  end

  def caveats
    <<~EOS
      To get started:

        1. Initialize WritersLogic:
           cpop init

        2. Calibrate VDF for your machine:
           cpop calibrate

        3. Create your first checkpoint:
           cpop commit your-document.md -m "Initial draft"

      For more information, see:
        https://writerslogic.com
    EOS
  end

  test do
    assert_match "cpop", shell_output("#{bin}/cpop --version")
  end
end
