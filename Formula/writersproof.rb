class Writersproof < Formula
  desc "Cryptographic authorship witnessing CLI for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.7"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.7-aarch64-apple-darwin.tar.gz"
      sha256 "10fde57766f627f62ebf93efbfbeb443c19719bdbcb97828a98241b581be2a2d"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.7-x86_64-apple-darwin.tar.gz"
      sha256 "b885116e6e47eee6f8174b2d8a8c1f10f813db769f99f78a19a8d2c446ce5813"
    end
  end

  # The engine and CLI both build for Linux (see release.yml / linux-packages.yml);
  # Homebrew requires a URL for every OS it audits a tap against regardless of which
  # OS actually runs `brew install`, so omitting this branch does not just skip
  # Linuxbrew support, it fails `brew tap` outright on macOS too ("invalid syntax in
  # tap!"), for every user, on every platform. R2 already serves these tarballs.
  on_linux do
    if Hardware::CPU.arm?
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6bef3c4b16e093ebff1d32ad15154ec59243b4dac5dbb1296fdc07de303dd907"
    else
      url "https://updates.writerslogic.com/cli/writersproof-cli-v1.0.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "11370f88f87d65774035e5d21a0918ed533d07301cab58469e6248c5ca43d1cc"
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
