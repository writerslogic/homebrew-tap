# Homebrew formula for witnessd (Rust implementation)
# To install: brew install writerslogic/tap/witnessd

class Witnessd < Formula
  desc "Cryptographic authorship witnessing for writers and creators"
  homepage "https://writerslogic.com"
  url "https://github.com/writerslogic/witnessd/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "f724eb1f06b80c6adad9a706a6a36ca3fa6a7f1ca952d687cc87edb172b72e73"
  license "PolyForm-Noncommercial-1.0.0"
  head "https://github.com/writerslogic/witnessd.git", branch: "main"

  depends_on "rust" => :build

  def install
    cd "rust/witnessd-cli" do
      system "cargo", "build", "--release"
      bin.install "target/release/witnessd-cli" => "witnessd"
    end

    # Install man pages if they exist
    man1.install "docs/man/witnessd.1" if File.exist?("docs/man/witnessd.1")
  end

  def caveats
    <<~EOS
      witnessd has been rewritten in Rust for improved performance and security.

      To get started:

        1. Initialize witnessd:
           witnessd init

        2. Create your first checkpoint:
           witnessd commit your-document.md -m "Initial draft"

      For more information, see:
        https://github.com/writerslogic/witnessd

      Privacy note: Keystroke tracking counts keystrokes only.
      It does NOT capture which keys are pressed.
    EOS
  end

  test do
    assert_match "witnessd", shell_output("#{bin}/witnessd --version")
  end
end
