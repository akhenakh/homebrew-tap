# typed: false
# frozen_string_literal: true

class Ou < Formula
  desc "Interactive terminal map for locations and geometries"
  homepage "https://github.com/akhenakh/ou"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.3/ou_Darwin_arm64.tar.gz"
      sha256 "704f1b278d54a928d693971d4c9ecc2a25f13589a03d36d5b99a512728ebd139"
    end
    on_intel do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.3/ou_Darwin_x86_64.tar.gz"
      sha256 "b03ae87ea1185def3ff9d3d4d6cfb43735c2da44caddde307028cd9f229d2fb4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.3/ou_Linux_arm64.tar.gz"
      sha256 "90b78bef89dbd4207ac9f290cac0d2d7cc9576332efcdba591e2da687fe80c13"
    end
    on_intel do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.3/ou_Linux_x86_64.tar.gz"
      sha256 "4b030df9e38091afa9f2ba41d30eb69387a39294b2fd7b1252b73649f48cd970"
    end
  end

  def install
    bin.install "ou"
  end
end
