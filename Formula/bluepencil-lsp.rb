class BluepencilLsp < Formula
  desc "Language server for bluepencil: echoes, passive voice, clichés, and more as editor diagnostics"
  homepage "https://github.com/writerslogic/bluepencil"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/bluepencil/releases/download/v0.1.0/bluepencil-lsp-aarch64-apple-darwin.tar.xz"
      sha256 "70cd69d6b494d54ffb145780f393c8bb3224f5d1560652dd82325ef326e583d0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/writerslogic/bluepencil/releases/download/v0.1.0/bluepencil-lsp-x86_64-apple-darwin.tar.xz"
      sha256 "d2b670caa26dc04ec035d65d2695197be47b5a4f2d6c9041420b7e5375f2553a"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/bluepencil/releases/download/v0.1.0/bluepencil-lsp-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8f74b6cb0eae42afbbe5ab657edd4621cddf7bd104ac805fcd82db1540203c1b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/writerslogic/bluepencil/releases/download/v0.1.0/bluepencil-lsp-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "bafde97f64d06a256e947e8b5dbe2c527e1daa5fef412dc30d644cbafe903947"
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
