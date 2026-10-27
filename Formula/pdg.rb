# typed: false
# frozen_string_literal: true

class Pdg < Formula
  desc "Zero-install pure-Go text-to-speech (Paradee v2g)"
  homepage "https://github.com/akhenakh/pdg"
  # The version is scanned from the release tag in the URL, so it must not be
  # declared explicitly. Apple Silicon is the default; on_intel overrides it.
  url "https://github.com/akhenakh/pdg/releases/download/v0.2.4/pdg_Darwin_arm64.tar.gz"
  sha256 "879ab9d1032d22f384599da586fb86b5eb360ad9d4d18e1616b96c06a3297ef8"
  license "Apache-2.0"

  # Homebrew on Linux is not supported; Linux users install the release
  # tarball directly.
  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/akhenakh/pdg/releases/download/v0.2.4/pdg_Darwin_x86_64.tar.gz"
      sha256 "b40dd488755fc884181c94dc3f229913be2c8749e748cd0f71c30a7096cb503c"
    end
  end

  def install
    bin.install "pdg"
  end

  test do
    assert_match "pdg", shell_output("#{bin}/pdg -version")
  end
end
