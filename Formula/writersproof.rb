class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "0.1.7"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "b1fa38b9ceef61f9cd9d14c47d423a9defd10c615afb059fe86a6c8b5caf7d30"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "41a3ff809720ffb53daa0aabd4647cae3393e66bb083d1449f99b62447546a71"
    end
  end

  def install
    bin.install "writersproof-cli"
    bin.install "writerslogic-native-messaging-host" if File.exist?("writerslogic-native-messaging-host")
  end

  def caveats
    <<~EOS
      The CLI version line now tracks the WritersProof app (0.1.3). Earlier
      formulae used a separate 1.5.x line, and Homebrew has no epoch, so
      `brew upgrade` will not move an existing 1.5.x install down to 0.1.3.
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
