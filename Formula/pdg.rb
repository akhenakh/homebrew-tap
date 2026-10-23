# typed: false
# frozen_string_literal: true

class Pdg < Formula
  desc "Zero-install pure-Go text-to-speech (Paradee v2g)"
  homepage "https://github.com/akhenakh/pdg"
  # The version is scanned from the release tag in the URL, so it must not be
  # declared explicitly. Apple Silicon is the default; on_intel overrides it.
  url "https://github.com/akhenakh/pdg/releases/download/v0.2.1/pdg_Darwin_arm64.tar.gz"
  sha256 "e5221b43d24b33d9d65d60b3268e2f64d71ebf65f2d3309a6e48f4eb8e5a84d7"
  license "Apache-2.0"

  # Homebrew on Linux is not supported; Linux users install the release
  # tarball directly.
  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/akhenakh/pdg/releases/download/v0.2.1/pdg_Darwin_x86_64.tar.gz"
      sha256 "7175859329a52a65ecc79c1c4ba81178ea6f071917b5e61d6c5f403f5761785b"
    end
  end

  def install
    bin.install "pdg"
  end

  test do
    assert_match "pdg", shell_output("#{bin}/pdg -version")
  end
end
