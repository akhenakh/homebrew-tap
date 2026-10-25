# typed: false
# frozen_string_literal: true

class Pdg < Formula
  desc "Zero-install pure-Go text-to-speech (Paradee v2g)"
  homepage "https://github.com/akhenakh/pdg"
  # The version is scanned from the release tag in the URL, so it must not be
  # declared explicitly. Apple Silicon is the default; on_intel overrides it.
  url "https://github.com/akhenakh/pdg/releases/download/v0.2.3/pdg_Darwin_arm64.tar.gz"
  sha256 "cc10b0fb2850cea67cbdd2442a253f717361172572fd4dfe64eb685cb1975072"
  license "Apache-2.0"

  # Homebrew on Linux is not supported; Linux users install the release
  # tarball directly.
  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/akhenakh/pdg/releases/download/v0.2.3/pdg_Darwin_x86_64.tar.gz"
      sha256 "ff6b32856097bdb9e7abc55d8bc01f62f6700e097434e567cdefb5cfc791aa9d"
    end
  end

  def install
    bin.install "pdg"
  end

  test do
    assert_match "pdg", shell_output("#{bin}/pdg -version")
  end
end
