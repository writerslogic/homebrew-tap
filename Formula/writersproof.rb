class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.10"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.10-aarch64-apple-darwin.tar.gz"
      sha256 "159719ddb8d99d5c7d012e120d1d1fdbfd31b6218bc3996e4ba5ca1b222d8c77"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.10-x86_64-apple-darwin.tar.gz"
      sha256 "b8213a5f7a185a04bfcce0c0a959456398126bbf2544f4a141efa4dc7108beef"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b6e82c8a32b3e789b39718c817d43d69e4c407bffee113c46a1ba6f419431449"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb96707e82305637232a4e58d15f44d08ee0488827327b7f9175a94d19015e32"
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
