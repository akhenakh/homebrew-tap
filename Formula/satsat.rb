# typed: false
# frozen_string_literal: true

class Satsat < Formula
  desc "Native satellite pass tracker"
  homepage "https://github.com/akhenakh/gosatsat"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.2/satsat_0.2_Darwin_arm64.tar.gz"
      sha256 "11e600338796805d8b1dca4d266979a224610b615b2edb16ca16353a0a64ba74"
    end
    on_intel do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.2/satsat_0.2_Darwin_x86_64.tar.gz"
      sha256 "06dc09771648f04842d92b4f179ff9e405f4355b187076760c0579a8e46a1169"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.2/satsat_0.2_Linux_arm64.tar.gz"
      sha256 "74efe573c7fe2a20b461f493cdef4f1002ac0a43dd67c2f6f7f3f7778b3a09c5"
    end
    on_intel do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.2/satsat_0.2_Linux_x86_64.tar.gz"
      sha256 "00ae4fbb12490b0b4d460339df9c264c6f6734f35c4ce8ed43c6af9586b01165"
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
