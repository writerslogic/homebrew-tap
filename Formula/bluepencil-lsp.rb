class BluepencilLsp < Formula
  desc "Language server for bluepencil: echoes, passive voice, clichés, and more as editor diagnostics"
  homepage "https://github.com/writerslogic/bluepencil"
  version "0.2.0"
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

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "bluepencil-lsp"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "bluepencil-lsp"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "bluepencil-lsp"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "bluepencil-lsp"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
