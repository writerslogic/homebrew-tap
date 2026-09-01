class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "0.1.13"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v0.1.13-aarch64-apple-darwin.tar.gz"
      sha256 "678d454a945c4404e06ce7957a34157190f8b3b8c7fa2f0e41581f3273b4dacb"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v0.1.13-x86_64-apple-darwin.tar.gz"
      sha256 "15567458bcd8f3e65c08f313d87cf04c944a956c8e1d91c241f954ace07ab239"
    end
  end

  def install
    bin.install "writersproof-cli"
    bin.install "writerslogic-native-messaging-host" if File.exist?("writerslogic-native-messaging-host")
  end

  def caveats
    <<~EOS
      The CLI version line now tracks the WritersProof app (0.1.x). Earlier
      formulae used a separate 1.5.x line, and Homebrew has no epoch, so
      `brew upgrade` will not move an existing 1.5.x install down to 0.1.x.
      If you are on 1.5.x, reinstall once to pick this up:

        brew uninstall writersproof && brew install writerslogic/tap/writersproof

      To get started:

        1. Initialize WritersProof:
           writersproof-cli init

        2. Calibrate VDF for your machine:
           writersproof-cli calibrate

        3. Create your first checkpoint:
           writersproof-cli commit your-document.md -m "Initial draft"

      For more information, see:
        https://writerslogic.com
    EOS
  end

  test do
    assert_match "writersproof-cli", shell_output("#{bin}/writersproof-cli --version")
  end
end
