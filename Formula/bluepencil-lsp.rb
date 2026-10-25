class BluepencilLsp < Formula
  desc "Language server for bluepencil prose analysis"
  homepage "https://writerslogic.github.io/bluepencil/"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/bluepencil/releases/download/v0.2.0/bluepencil-lsp-aarch64-apple-darwin.tar.xz"
      sha256 "72318a18b13b81b742a291d2fc6e5a18fc55a745b2fa5cbb7bc23aeba50dbf1d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/writerslogic/bluepencil/releases/download/v0.2.0/bluepencil-lsp-x86_64-apple-darwin.tar.xz"
      sha256 "caac8bfa1de0813ec0877d392a462c2a8c1ecfd59dcce73b1bdebb9a2e37ae39"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/bluepencil/releases/download/v0.2.0/bluepencil-lsp-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "400284c1fe86c31f04bd32ff834471660ca38974fd6b84db6b1f23cc52f6fbe2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/writerslogic/bluepencil/releases/download/v0.2.0/bluepencil-lsp-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "75f35a72a92ccd9e807ea3c028b118ef90d544264ce12c19c79179919bbfc0f2"
    end
  end
  license any_of: ["MIT", "Apache-2.0"]

  def install
    bin.install "bluepencil-lsp"
  end

  test do
    assert_predicate bin/"bluepencil-lsp", :executable?
  end
end
