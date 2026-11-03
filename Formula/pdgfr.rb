# typed: false
# frozen_string_literal: true

class Pdgfr < Formula
  desc "Zero-install pure-Go French text-to-speech (Brindille)"
  homepage "https://github.com/akhenakh/pdgfr"
  # The version is scanned from the release tag in the URL, so it must not be
  # declared explicitly. Apple Silicon is the default; on_intel overrides it.
  url "https://github.com/akhenakh/pdgfr/releases/download/v0.1/pdgfr_Darwin_arm64.tar.gz"
  sha256 "275f412d38c7e847ff11af85566ce2af8e811ff021fc569e35734799ca14c2ef"
  license "Apache-2.0"

  # Homebrew on Linux is not supported; Linux users install the release
  # tarball directly.
  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/akhenakh/pdgfr/releases/download/v0.1/pdgfr_Darwin_x86_64.tar.gz"
      sha256 "b62a63047a169a5f69ad112387a91d5bd032a54356417053fbba876b4ccf9ade"
    end
  end

  def install
    bin.install "pdgfr"
  end

  test do
    assert_match "pdgfr", shell_output("#{bin}/pdgfr -version")
  end
end
