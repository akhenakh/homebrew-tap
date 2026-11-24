# typed: false
# frozen_string_literal: true

class Rp2350sim < Formula
  desc "RP2350 emulator with a desktop UI"
  homepage "https://github.com/akhenakh/rp2350sim"
  # Apple Silicon is the default; on_intel overrides it.
  url "https://github.com/akhenakh/rp2350sim/releases/download/v0.1.0/rp2350sim_0.1.0_darwin_arm64.tar.gz"
  sha256 "72817372ee0498b8a04463ff376f17b6ab8859f68854c7d6ffdf43d7834970ea"
  license "Apache-2.0"

  # Homebrew on Linux is not supported; Linux users install the release
  # tarball directly.
  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/akhenakh/rp2350sim/releases/download/v0.1.0/rp2350sim_0.1.0_darwin_amd64.tar.gz"
      sha256 "422ba1d94ed8acec577531e0849ec0dfb36c05ae0e99591afe340edbae05fbfe"
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
