# typed: false
# frozen_string_literal: true

class Pdg < Formula
  desc "Zero-install pure-Go text-to-speech (Paradee v2g)"
  homepage "https://github.com/akhenakh/pdg"
  # The version is scanned from the release tag in the URL, so it must not be
  # declared explicitly. Apple Silicon is the default; on_intel overrides it.
  url "https://github.com/akhenakh/pdg/releases/download/v0.2.2/pdg_Darwin_arm64.tar.gz"
  sha256 "17d99052040cf57793020e6d75e1888e0aa17af539e88c7f139d994c1de654ec"
  license "Apache-2.0"

  # Homebrew on Linux is not supported; Linux users install the release
  # tarball directly.
  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/akhenakh/pdg/releases/download/v0.2.2/pdg_Darwin_x86_64.tar.gz"
      sha256 "557302a373b234b783ece6d65868a477386508523f2699bfb2df316d76ae650d"
    end
  end

  def install
    bin.install "pdg"
  end

  test do
    assert_match "pdg", shell_output("#{bin}/pdg -version")
  end
end
