# typed: false
# frozen_string_literal: true

class Pdg < Formula
  desc "Zero-install pure-Go text-to-speech (Paradee v2g)"
  homepage "https://github.com/akhenakh/pdg"
  # The version is scanned from the release tag in the URL, so it must not be
  # declared explicitly. Apple Silicon is the default; on_intel overrides it.
  url "https://github.com/akhenakh/pdg/releases/download/v0.2/pdg_Darwin_arm64.tar.gz"
  sha256 "d26ac7940aa16ba622ea3305f8dd0bacaef2d4e3288f93386ce02524d0d42ab7"
  license "Apache-2.0"

  # Homebrew on Linux is not supported; Linux users install the release
  # tarball directly.
  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/akhenakh/pdg/releases/download/v0.2/pdg_Darwin_x86_64.tar.gz"
      sha256 "666d711e665955293e60117d2c30c71aa19fc773688e590a906c85f96c7b2550"
    end
  end

  def install
    bin.install "pdg"
  end

  test do
    assert_match "pdg", shell_output("#{bin}/pdg -version")
  end
end
