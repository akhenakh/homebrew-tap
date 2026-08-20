# typed: false
# frozen_string_literal: true

class Ou < Formula
  desc "Interactive terminal map for locations and geometries"
  homepage "https://github.com/akhenakh/ou"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/ou/releases/download/v0.1/ou_Darwin_arm64.tar.gz"
      sha256 "88f44d474690e59266d43af2cb5215cc5b1d3055082e62569301f54fd5735940"
    end
    on_intel do
      url "https://github.com/akhenakh/ou/releases/download/v0.1/ou_Darwin_x86_64.tar.gz"
      sha256 "f0ed7f89e9b9a4c777a6ab0b39a18760e8967a5a7f233b3b1d59fe75810e63f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/ou/releases/download/v0.1/ou_Linux_arm64.tar.gz"
      sha256 "11cc87aecc373be2cfae866f6137362af6f881586a67dfea203754dba99633fe"
    end
    on_intel do
      url "https://github.com/akhenakh/ou/releases/download/v0.1/ou_Linux_x86_64.tar.gz"
      sha256 "05a154321b6e33d70312343a6cac963103bec4e121292dcf9edac2c544769a0b"
    end
  end

  def install
    bin.install "ou"
  end
end
