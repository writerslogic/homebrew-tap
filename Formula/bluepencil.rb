class Bluepencil < Formula
  desc "Prose analysis for writers: echoes, repeats, rhythm, dialogue, readability, and more"
  homepage "https://github.com/writerslogic/bluepencil"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/bluepencil/releases/download/v0.1.0/bluepencil-aarch64-apple-darwin.tar.xz"
      sha256 "1d5d7f2b54ebb95b1ad554c10253f3916bbf4eaac6e0c1974ddda99fc53f27dd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/writerslogic/bluepencil/releases/download/v0.1.0/bluepencil-x86_64-apple-darwin.tar.xz"
      sha256 "631c87cb5d34c78aff14f03d75e8a8416516f9008c736e428905c81b5ff780c0"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/writerslogic/bluepencil/releases/download/v0.1.0/bluepencil-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1acad65642316ffda2a39a6d80ffd6c9c7caba635f9022092a7b52e31bb3cc64"
    end
    if Hardware::CPU.intel?
      url "https://github.com/writerslogic/bluepencil/releases/download/v0.1.0/bluepencil-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "45b3fd77a1b3c9e88412f119e7ebcdab7400690427fad9bdee79dfd8d84bbd76"
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
      bin.install "bluepencil"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "bluepencil"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "bluepencil"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "bluepencil"
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
