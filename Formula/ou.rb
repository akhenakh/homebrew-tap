# typed: false
# frozen_string_literal: true

class Ou < Formula
  desc "Interactive terminal map for locations and geometries"
  homepage "https://github.com/akhenakh/ou"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.6/ou_Darwin_arm64.tar.gz"
      sha256 "6639b790c77d5206f269fdcd256ae102896c70c78595f9a749b2f914644b63f3"
    end
    on_intel do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.6/ou_Darwin_x86_64.tar.gz"
      sha256 "0e337360a7a1087249184e82070d57c2f0cf536d7aa87683bddde8d47b06ad9b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.6/ou_Linux_arm64.tar.gz"
      sha256 "1f1a87707a18d51bfe1f11a68c1193c10911fac89625ee6d1051630433cb5fe2"
    end
    on_intel do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.6/ou_Linux_x86_64.tar.gz"
      sha256 "c02abd2204f7f5e0046b99e548d3c6de801f139a3505a3966da131400163411b"
    end
  end

  def install
    bin.install "ou"
  end

  test do
    assert_match "flag provided but not defined", shell_output("#{bin}/ou -bogus 2>&1", 2)
  end
end
