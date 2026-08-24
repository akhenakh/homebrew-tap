# typed: false
# frozen_string_literal: true

class Ou < Formula
  desc "Interactive terminal map for locations and geometries"
  homepage "https://github.com/akhenakh/ou"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.4/ou_Darwin_arm64.tar.gz"
      sha256 "6163e4f74ea099f565233fdedcb734d2ba24b730b45be4230eb34518444697da"
    end
    on_intel do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.4/ou_Darwin_x86_64.tar.gz"
      sha256 "a300d59b6895730b761e22322a679a164bb322421df918cf8586de0391f420d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.4/ou_Linux_arm64.tar.gz"
      sha256 "57626c45972c9b5cd0e252395e27cbe17aa9113a8103eecf263c014f2bd07e47"
    end
    on_intel do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.4/ou_Linux_x86_64.tar.gz"
      sha256 "504b9ef1d2116fc51480643f7c5d61b4127217852897c8c418cf56aab73f37e6"
    end
  end

  def install
    bin.install "ou"
  end
end
