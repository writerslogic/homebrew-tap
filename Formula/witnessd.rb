# Homebrew formula for witnessd CLI
# To install: brew install writerslogic/tap/witnessd

class Witnessd < Formula
  desc "Cryptographic authorship witnessing for writers and creators"
  homepage "https://writerslogic.com"
  url "https://github.com/writerslogic/witnessd-cli/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "f724eb1f06b80c6adad9a706a6a36ca3fa6a7f1ca952d687cc87edb172b72e73"
  license "Apache-2.0"
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
