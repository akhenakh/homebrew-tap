# typed: false
# frozen_string_literal: true

class Ou < Formula
  desc "Interactive terminal map for locations and geometries"
  homepage "https://github.com/akhenakh/ou"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.2/ou_Darwin_arm64.tar.gz"
      sha256 "f40bc4dd3d10946a698edb63fbef72050712c8d431997e92fdeae3408e71b21d"
    end
    on_intel do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.2/ou_Darwin_x86_64.tar.gz"
      sha256 "e140f6c8ae19b8c96fce07c2691c2ee3df56ce2e988a7d325a665d3c81280f5f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.2/ou_Linux_arm64.tar.gz"
      sha256 "8eda774a1e951e1af164bb762e5dbdff9c7b9a497a9b1c4ea8562993779efdb6"
    end
    on_intel do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.2/ou_Linux_x86_64.tar.gz"
      sha256 "0ccbfc95a58167e98ab975704fa2d07771c5e15b5fd9a93617a3c7a3981e78b9"
    end
  end

  def install
    bin.install "ou"
  end
end
