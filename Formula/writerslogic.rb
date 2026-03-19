# Homebrew formula for WritersLogic CLI
# To install: brew install writerslogic/tap/writerslogic

class Writerslogic < Formula
  desc "Cryptographic authorship witnessing for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.5"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/cpop/releases/download/v1.0.5/writerslogic-v1.0.5-aarch64-apple-darwin.tar.gz"
      sha256 "fad696868018a787b305ca3af247d0fc3160d82bd2080105c6ecb6528f9d006d"
    else
      url "https://github.com/writerslogic/cpop/releases/download/v1.0.5/writerslogic-v1.0.5-x86_64-apple-darwin.tar.gz"
      sha256 "c33690d34afe519930af0bc36873f07e3d5ce3f84028a0f21474f851a3cc0caf"
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
