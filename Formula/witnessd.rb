# Homebrew formula for witnessd CLI
# To install: brew install writerslogic/tap/witnessd

class Witnessd < Formula
  desc "Cryptographic authorship witnessing for writers and creators"
  homepage "https://writerslogic.com"
  url "https://github.com/writerslogic/witnessd-cli/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "6cf4ae24b0635a74621def020a42a79fe38cc95c42ce73a67d8c2cbb7623ba70"
  license "GPL-3.0-only"
  head "https://github.com/writerslogic/witnessd-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/witnessd-cli" => "witnessd"
  end

  def caveats
    <<~EOS
      To get started:

        1. Initialize witnessd:
           witnessd init

        2. Create your first checkpoint:
           witnessd commit your-document.md -m "Initial draft"

      For more information, see:
        https://github.com/writerslogic/witnessd-cli

      Privacy note: Keystroke tracking counts keystrokes only.
      It does NOT capture which keys are pressed.
    EOS
  end

  test do
    assert_match "witnessd", shell_output("#{bin}/witnessd --version")
  end
end
