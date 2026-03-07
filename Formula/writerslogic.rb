# Homebrew formula for WritersLogic CLI
# To install: brew install writerslogic/tap/writerslogic

class Writerslogic < Formula
  desc "Cryptographic authorship witnessing for writers and creators"
  homepage "https://writerslogic.com"
  version "0.2.2"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/witnessd/releases/download/v0.2.2/writerslogic_v0.2.2_aarch64-apple-darwin.tar.gz"
      sha256 "2b4b02e451962c1515c66de5437f8781760d645e816ebd56bd93609012f0f8ef"
    else
      url "https://github.com/writerslogic/witnessd/releases/download/v0.2.2/writerslogic_v0.2.2_x86_64-apple-darwin.tar.gz"
      sha256 "ccd746a91fbab3646c3d0cc20cbba68e74b7da5d1939dc743373f279b445af92"
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
