# typed: false
# frozen_string_literal: true

class Rp2350sim < Formula
  desc "RP2350 emulator with a desktop UI"
  homepage "https://github.com/akhenakh/rp2350sim"
  # Apple Silicon is the default; on_intel overrides it.
  url "https://github.com/akhenakh/rp2350sim/releases/download/v0.3.0/rp2350sim_0.3.0_darwin_arm64.tar.gz"
  sha256 "e9f750f0d2b6e9783bdd87981dafd500e635ca04f9f215c9377c8907edf962c5"
  license "Apache-2.0"

  # Homebrew on Linux is not supported; Linux users install the release
  # tarball directly.
  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/akhenakh/rp2350sim/releases/download/v0.3.0/rp2350sim_0.3.0_darwin_amd64.tar.gz"
      sha256 "b45b729ab6b2662db8d7f358f21b5e67fe307b36b8fb9f9f936ec12e2843dd54"
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
