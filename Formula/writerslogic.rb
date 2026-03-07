# Homebrew formula for WritersLogic CLI
# To install: brew install writerslogic/tap/writerslogic

class Writerslogic < Formula
  desc "Cryptographic authorship witnessing for writers and creators"
  homepage "https://writerslogic.com"
  version "0.2.1"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/witnessd/releases/download/v0.2.1/writerslogic_v0.2.1_aarch64-apple-darwin.tar.gz"
      sha256 "e451924f9330f168e5d7da8c17acdab6252e91c35b4acdd4fcd571b65a20812d"
    else
      url "https://github.com/writerslogic/witnessd/releases/download/v0.2.1/writerslogic_v0.2.1_x86_64-apple-darwin.tar.gz"
      sha256 "74d0a5254d8e4fad581f0d8d588d1ab299e68ce62a740751f2f6396945591b87"
    end
  end

  def install
    bin.install "writerslogic"
    bin.install "wld"
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
        https://github.com/writerslogic/witnessd

      Privacy note: Keystroke tracking counts keystrokes only.
      It does NOT capture which keys are pressed.
    EOS
  end

  test do
    assert_match "wld_cli", shell_output("#{bin}/writerslogic --version")
  end
end
