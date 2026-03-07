# Homebrew formula for WritersLogic CLI
# To install: brew install writerslogic/tap/writerslogic

class Writerslogic < Formula
  desc "Cryptographic authorship witnessing for writers and creators"
  homepage "https://writerslogic.com"
  version "0.2.0"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/witnessd/releases/download/v0.2.0/writerslogic_v0.2.0_aarch64-apple-darwin.tar.gz"
      sha256 "a348e7153bd58e5034a3632c03d7848a0b8d64506db57d6678a6178a096726d7"
    else
      url "https://github.com/writerslogic/witnessd/releases/download/v0.2.0/writerslogic_v0.2.0_x86_64-apple-darwin.tar.gz"
      sha256 "d8a7f4a29785d8d477197a7b817b3f96741ad7e536b89c96a4cfe51ff324e59b"
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
    assert_match "writerslogic", shell_output("#{bin}/writerslogic --version")
  end
end
