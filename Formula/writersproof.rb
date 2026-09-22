class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.11"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.11-aarch64-apple-darwin.tar.gz"
      sha256 "dbcccb9c9d0577ade4a36f15715bbbf51e5b0bb929650d6aa8e1666dbb1c63a7"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.11-x86_64-apple-darwin.tar.gz"
      sha256 "2d18331755567a1614b2de07999c6ce9c1fb93168e0e1ab7ccfe6f699b993303"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "528efc58eeadd1c9529689ae606728dc0e071f273ca980ac6bc03095a9fda8af"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e23e097e0c6651cbebc26e32e3149e00b1107a11670cc8df00c5fda117f6995e"
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
