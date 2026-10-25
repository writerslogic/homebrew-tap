class Bluepencil < Formula
  desc "Prose analysis toolkit for writers"
  homepage "https://writerslogic.github.io/bluepencil/"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/bluepencil/releases/download/v0.2.0/bluepencil-aarch64-apple-darwin.tar.xz"
      sha256 "e34b716973753fd667e6f2a1b70dbb6e4fa2fb856a5ade7f26e84a4dff712455"
    end
    if Hardware::CPU.intel?
      url "https://github.com/writerslogic/bluepencil/releases/download/v0.2.0/bluepencil-x86_64-apple-darwin.tar.xz"
      sha256 "a5a928d6544e0d022da7c7d012c1886fce88ab9028b6d2a13699ca8ddd157f62"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/bluepencil/releases/download/v0.2.0/bluepencil-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "12e54ec0cf9f4f3d5174add5e3618621f008a13b5fb2f39dbe4801839516db91"
    end
    if Hardware::CPU.intel?
      url "https://github.com/writerslogic/bluepencil/releases/download/v0.2.0/bluepencil-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7edee34e8efdb632d335335582cf91dd47810875a855fbb03f6a50d6e975865f"
    end
  end
  license any_of: ["MIT", "Apache-2.0"]

  def install
    bin.install "bluepencil"
  end

  test do
    assert_match "bluepencil 0.2.0", shell_output("#{bin}/bluepencil --version")
  end
end
