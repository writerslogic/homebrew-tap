class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.12"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.12-aarch64-apple-darwin.tar.gz"
      sha256 "db536690e6823280e6765eae9274238721d64e6e6ca48a5738c0b0dd4c32e50f"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.12-x86_64-apple-darwin.tar.gz"
      sha256 "8c29b0ae9cd1f90ea1fef56b5df32ca73df8eebf0a7fd5be8f54a4b9ab969a6d"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "69017ae1957b528e37dd6bc69e82aa0e7679911ef9fa32f761a5a592f570778a"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9b9606d9f3f92ed8511bed8e52ede12d1128902c1246634b1690d144ac4292b"
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
