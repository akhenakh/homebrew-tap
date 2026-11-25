# typed: false
# frozen_string_literal: true

class Rp2350sim < Formula
  desc "RP2350 emulator with a desktop UI"
  homepage "https://github.com/akhenakh/rp2350sim"
  # Apple Silicon is the default; on_intel overrides it.
  url "https://github.com/akhenakh/rp2350sim/releases/download/v0.2.0/rp2350sim_0.2.0_darwin_arm64.tar.gz"
  sha256 "808b5f6df62f6a9d51bddbbb632f5b3992ce4baa9b7b3cb4839bfcc38b2f12a0"
  license "Apache-2.0"

  # Homebrew on Linux is not supported; Linux users install the release
  # tarball directly.
  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/akhenakh/rp2350sim/releases/download/v0.2.0/rp2350sim_0.2.0_darwin_amd64.tar.gz"
      sha256 "7bae903dcf946a177280d19f2d812267e3a120124ab45cef916e131a6fff54d3"
    end
  end

  def install
    bin.install "rp2350sim"
    bin.install "rp2350sim-ui"
  end

  test do
    assert_match "rp2350sim", shell_output("#{bin}/rp2350sim -version")
    assert_match "rp2350sim-ui", shell_output("#{bin}/rp2350sim-ui --version")
  end
end
