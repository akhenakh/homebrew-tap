# typed: false
# frozen_string_literal: true

class Ou < Formula
  desc "Interactive terminal map for locations and geometries"
  homepage "https://github.com/akhenakh/ou"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.5/ou_Darwin_arm64.tar.gz"
      sha256 "66e0fa214bdcfe2112a319c8867eed9fc44df86d43f2425a585a257595f9db7e"
    end
    on_intel do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.5/ou_Darwin_x86_64.tar.gz"
      sha256 "fb7643e93e9dcf060703a015a247ae638249d2df88e5dbf071ffa12daa85cfb7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.5/ou_Linux_arm64.tar.gz"
      sha256 "37c2592a975c94193308f8ca50010f063b105f2c05e95afe9a484c96686c44d5"
    end
    on_intel do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.5/ou_Linux_x86_64.tar.gz"
      sha256 "70f1082f95f1c6fe306df769de48f6513b8781f61a7bd559df139164673b43e6"
    end
  end

  def install
    bin.install "ou"
  end
end
