# typed: false
# frozen_string_literal: true

class Satsat < Formula
  desc "Native satellite pass tracker"
  homepage "https://github.com/akhenakh/gosatsat"
  license "MIT"
  version "0.1"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.1/satsat_0.1_Darwin_arm64.tar.gz"
      sha256 "3efa5f47a28f17eb95d60cf814f14b71be6a92d3b5cb5f5437f36d194988308d"
    end
    on_intel do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.1/satsat_0.1_Darwin_x86_64.tar.gz"
      sha256 "e498303ff15b1e8097e42c8cd05890c659f918aa52608f2330acea55928cfce3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.1/satsat_0.1_Linux_arm64.tar.gz"
      sha256 "a3010888e17edd18495915c94a735b79c3e86150bf936a3d0a542a4911b5262c"
    end
    on_intel do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.1/satsat_0.1_Linux_x86_64.tar.gz"
      sha256 "d0f8c258307ed4bb23c12f8ecef478e1fea1dde34cdfdf914ba7dac76a646475"
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
