class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.22"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.22-aarch64-apple-darwin.tar.gz"
      sha256 "9fed2892282ccd779b80fecf9b72afa87d2741208329f6c5eda08ef35d69ec93"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.22-x86_64-apple-darwin.tar.gz"
      sha256 "11ea337a53c0aee03fd1b1754b817ecf9a46685ed4a01d4e01b11d81da1b7844"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8db6efc276ded22ca5d53ed30d55b410a6fdab932e27fe6fbeff6c034619c665"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "21a1a843c13dcfc86b12c273e6bb90c8bc046b94e4040019df9fb0ef0127eee0"
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
