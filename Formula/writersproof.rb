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
