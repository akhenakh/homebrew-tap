# typed: false
# frozen_string_literal: true

class Ou < Formula
  desc "Interactive terminal map for locations and geometries"
  homepage "https://github.com/akhenakh/ou"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.1/ou_Darwin_arm64.tar.gz"
      sha256 "15a3e426d08d86eac76f8c93e5eebcdbefcd774e9dd2826ce11a8107c9794911"
    end
    on_intel do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.1/ou_Darwin_x86_64.tar.gz"
      sha256 "00d3f1129372f5612eac49649098f41a5e5fb93fd883d2aa8f6c022314e1e023"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.1/ou_Linux_arm64.tar.gz"
      sha256 "ac6e7ba7ca55060e82b538928ab5edcbb0ccd9741a3720c4ef54f7f9390f612a"
    end
    on_intel do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.1/ou_Linux_x86_64.tar.gz"
      sha256 "569395e62f7fe3668da2fcefee0cc78254ccfa41d95156c278b5f1933bb4b5eb"
    end
  end

  def install
    bin.install "ou"
  end
end
