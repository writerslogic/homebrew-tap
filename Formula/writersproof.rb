class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.18"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.18-aarch64-apple-darwin.tar.gz"
      sha256 "f348f16af1888c0f6a1526789f7e94f60d2f6b88fec68216ccdb88e4c5541d78"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.18-x86_64-apple-darwin.tar.gz"
      sha256 "dc2c3b9d57ef5943d4a1f18efb57a40063657c121e17abef9d761a3d92169dc6"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d3b9ec1d62ac972d8ed8217ac3531d68b9215cec8c39f0717144983e4730523"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "13507671d142b8702ba05cb78c5ec9d395429b91719bd88d3b68ad387e6dc744"
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
