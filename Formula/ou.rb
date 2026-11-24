# typed: false
# frozen_string_literal: true

class Ou < Formula
  desc "Interactive terminal map for locations and geometries"
  homepage "https://github.com/akhenakh/ou"
  # Apple Silicon is the default; on_intel overrides it.
  url "https://github.com/akhenakh/ou/releases/download/v0.1.6/ou_Darwin_arm64.tar.gz"
  sha256 "6639b790c77d5206f269fdcd256ae102896c70c78595f9a749b2f914644b63f3"
  license "MIT"

  # Homebrew on Linux is not supported; Linux users install the release
  # tarball directly.
  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/akhenakh/ou/releases/download/v0.1.6/ou_Darwin_x86_64.tar.gz"
      sha256 "0e337360a7a1087249184e82070d57c2f0cf536d7aa87683bddde8d47b06ad9b"
    end
  end

  def install
    bin.install "ou"
  end

  test do
    assert_match "flag provided but not defined", shell_output("#{bin}/ou -bogus 2>&1", 2)
  end
end
