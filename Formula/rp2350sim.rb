# typed: false
# frozen_string_literal: true

class Rp2350sim < Formula
  desc "RP2350 emulator with a desktop UI"
  homepage "https://github.com/akhenakh/rp2350sim"
  # Apple Silicon is the default; on_intel overrides it.
  url "https://github.com/akhenakh/rp2350sim/releases/download/v0.5.0/rp2350sim_0.5.0_darwin_arm64.tar.gz"
  sha256 "84e1d51ab61bc60cd421ce6850eda03cbee4678e052c534b461d6ce444fcf39c"
  license "Apache-2.0"

  # Homebrew on Linux is not supported; Linux users install the release
  # tarball directly.
  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/akhenakh/rp2350sim/releases/download/v0.5.0/rp2350sim_0.5.0_darwin_amd64.tar.gz"
      sha256 "518968d018c226350f31246c0adedddfd575925ff294ac21da69973d93c49568"
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
