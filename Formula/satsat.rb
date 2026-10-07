# typed: false
# frozen_string_literal: true

class Satsat < Formula
  desc "Native satellite pass tracker"
  homepage "https://github.com/akhenakh/gosatsat"
  license "MIT"

  depends_on :linux

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.4/satsat_0.4_Linux_arm64.tar.gz"
      sha256 "21909a6c2ba67eb8f4c6c35024fc405967c40ab3596df9b4f924c6f68da5c694"
    end
    on_intel do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.4/satsat_0.4_Linux_x86_64.tar.gz"
      sha256 "777fe290963cde242431a21ecbf4df8dca7042c0ecd0ac473317d77c84875195"
    end
  end

  def install
    # app.ResourcePath resolves <exeDir>/Resources, so keep both together.
    libexec.install "satsat"
    libexec.install "Resources"
    bin.install_symlink libexec/"satsat"
  end

  test do
    system "#{bin}/satsat", "--help"
  end
end
