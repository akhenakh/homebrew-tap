# typed: false
# frozen_string_literal: true

class Satsat < Formula
  desc "Native satellite pass tracker"
  homepage "https://github.com/akhenakh/gosatsat"
  license "MIT"

  depends_on :linux

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.5/satsat_0.5_Linux_arm64.tar.gz"
      sha256 "9b19b86484dad236a84b070d42b5b938d3f61d016f536e50aff0413b9f20d911"
    end
    on_intel do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.5/satsat_0.5_Linux_x86_64.tar.gz"
      sha256 "9c818a3a244b83bde6f011fe95ad2d6e9c033180a1ad73a623611cf07ac90e3f"
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
