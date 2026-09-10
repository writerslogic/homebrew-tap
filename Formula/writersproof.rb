class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.2"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "97ee8c0dd3d8bbe9e88e09c166c99b8110ecf58f3a41d598d23d8c27a0ffcd92"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.2-x86_64-apple-darwin.tar.gz"
      sha256 "2ce01a1e533d8bf91e103b1cecb52b91ddc252255214effdc4ca84588410e5cb"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a5eac3d2ad9d54556d3c7d5cb100ab109866623ea5d2d4626b38420334f5cce4"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3a616425097a480f36d3105d06aea58c3a125da9644ea417c1d138882e28a395"
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
