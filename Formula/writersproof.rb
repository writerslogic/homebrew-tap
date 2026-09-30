class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.15"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.15-aarch64-apple-darwin.tar.gz"
      sha256 "d9ac843f8437d75c705799836da1a5c17ba5206f0e5e73a981441b6d409225c7"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.15-x86_64-apple-darwin.tar.gz"
      sha256 "e288aaf18d53e523151413c3aa2d57c0db11ac356659ddccff638078239435f8"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "395194618a431592a3d680bea884b88bfb2297b43d547149373b17ed6ed9d4a6"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d28a2dd2366c8f8fc989cc05ed3cd706b0e22e9398e19571f9bd8c21569268d6"
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
