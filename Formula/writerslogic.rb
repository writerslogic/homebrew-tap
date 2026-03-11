# Homebrew formula for WritersLogic CLI
# To install: brew install writerslogic/tap/writerslogic

class Writerslogic < Formula
  desc "Cryptographic authorship witnessing for writers and creators"
  homepage "https://writerslogic.com"
  version "0.3.6"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/witnessd/releases/download/v0.3.6/writerslogic-v0.3.6-aarch64-apple-darwin.tar.gz"
      sha256 "df97718c639a5aa1abe535a31533fd8a70825f6787d9bc6e853752c5dd4b1c32"
    else
      url "https://github.com/writerslogic/witnessd/releases/download/v0.3.6/writerslogic-v0.3.6-x86_64-apple-darwin.tar.gz"
      sha256 "3194a7f0a0fcf9da08e6f483c70499e955569a2b75f29de0ba80cfe8b19a77f0"
    end
  end

  def install
    bin.install "wld"
    bin.install "writerslogic-native-messaging-host" if File.exist?("writerslogic-native-messaging-host")
  end

  def caveats
    <<~EOS
      To get started:

        1. Initialize WritersLogic:
           wld init

        2. Calibrate VDF for your machine:
           wld calibrate

        3. Create your first checkpoint:
           wld commit your-document.md -m "Initial draft"

      For more information, see:
        https://writerslogic.com
    EOS
  end

  test do
    assert_match "wld_cli", shell_output("#{bin}/wld --version")
  end
end
