# Homebrew formula for WritersLogic CLI
# To install: brew install writerslogic/tap/writerslogic

class Writerslogic < Formula
  desc "Cryptographic authorship witnessing for writers and creators"
  homepage "https://writerslogic.com"
  version "1.0.3"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/cpop/releases/download/v1.0.3/writerslogic-v1.0.3-aarch64-apple-darwin.tar.gz"
      sha256 "6fc5b6edebbf072b471246380aa3ae622f986167736d11ac760df57e1fad3ca6"
    else
      url "https://github.com/writerslogic/cpop/releases/download/v1.0.3/writerslogic-v1.0.3-x86_64-apple-darwin.tar.gz"
      sha256 "0db4b80420e9ef77990448c1bcd4ae723fec88f433469d6579405e1ab4c373cf"
    end
  end

  def install
    bin.install "cpop"
    bin.install "writerslogic-native-messaging-host" if File.exist?("writerslogic-native-messaging-host")
  end

  def caveats
    <<~EOS
      To get started:

        1. Initialize WritersLogic:
           cpop init

        2. Calibrate VDF for your machine:
           cpop calibrate

        3. Create your first checkpoint:
           cpop commit your-document.md -m "Initial draft"

      For more information, see:
        https://writerslogic.com
    EOS
  end

  test do
    assert_match "cpop", shell_output("#{bin}/cpop --version")
  end
end
