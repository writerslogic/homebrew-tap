# Homebrew formula for witnessd (Rust implementation)
# To install: brew install writerslogic/tap/witnessd

class Witnessd < Formula
  desc "Cryptographic authorship witnessing for writers and creators"
  homepage "https://writerslogic.com"
  url "https://github.com/writerslogic/witnessd/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b85a2e214b88e38e24da60974bb121a49dcb0c459b783a5ae506afd904cd58ee"
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

      For the legacy Go implementation, see:
        https://github.com/writerslogic/witnessd/tree/legacy-go-v1

      Privacy note: Keystroke tracking counts keystrokes only.
      It does NOT capture which keys are pressed.
    EOS
  end

  test do
    assert_match "witnessd", shell_output("#{bin}/witnessd --version")
  end
end
