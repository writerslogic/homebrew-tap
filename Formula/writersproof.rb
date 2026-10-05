class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.19"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.19-aarch64-apple-darwin.tar.gz"
      sha256 "867c4ff992fd890e7bd955f0c483ade7215ec8f3d1d15db8c91ed093ac8cc96f"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.19-x86_64-apple-darwin.tar.gz"
      sha256 "456b1a9a6c2a602035e4e7483598c041da94db58635dd3caaf35cfd97b474eda"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bd9245d0aa7ae62908060dfa000473f3dbc0d3117080010761a3466b2e53be6a"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9e2ed5b17599830ef9158523ce27585219d1430a1be2b7be419b9ce9c28bf6d5"
    end
  end

  def install
    bin.install "writersproof-cli"
    bin.install "writerslogic-native-messaging-host" if File.exist?("writerslogic-native-messaging-host")
  end

  def caveats
    <<~EOS
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
