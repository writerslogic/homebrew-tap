# Homebrew formula for WritersLogic CLI
# To install: brew install writerslogic/tap/writerslogic

class Writerslogic < Formula
  desc "Cryptographic authorship witnessing for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.2"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/cpop/releases/download/v1.0.2/writerslogic-v1.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "772006239d57dbfe11b3a6b6fb9fb65a112a5a967ef3bbd592a36742659ecff3"
    else
      url "https://github.com/writerslogic/cpop/releases/download/v1.0.2/writerslogic-v1.0.2-x86_64-apple-darwin.tar.gz"
      sha256 "2249ddc28a2393e92904db2e850ac4ea3a86779623cd88fb2e1a49b5998d579a"
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
