# typed: false
# frozen_string_literal: true

class Pdg < Formula
  desc "PDG: zero-install pure-Go text-to-speech (Paradee v2g)"
  homepage "https://github.com/akhenakh/pdg"
  version "0.2"
  license "Apache-2.0"

  # The Linux x86_64 archive is the default; the blocks below replace it per
  # OS and architecture.
  url "https://github.com/akhenakh/pdg/releases/download/v0.2/pdg_Linux_x86_64.tar.gz"
  sha256 "8d333f2e15de58ad06a931d888e48cc5091cefeca137c1c9a0f42185ca3b0491"

  on_macos do
    on_intel do
      url "https://github.com/akhenakh/pdg/releases/download/v0.2/pdg_Darwin_x86_64.tar.gz"
      sha256 "666d711e665955293e60117d2c30c71aa19fc773688e590a906c85f96c7b2550"
    end
    on_arm do
      url "https://github.com/akhenakh/pdg/releases/download/v0.2/pdg_Darwin_arm64.tar.gz"
      sha256 "d26ac7940aa16ba622ea3305f8dd0bacaef2d4e3288f93386ce02524d0d42ab7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/pdg/releases/download/v0.2/pdg_Linux_arm64.tar.gz"
      sha256 "ee1bef87c2f8f5ddd9bcc29e6b116f9c35f283d252dc98c93dd03fb12c7e6525"
    end
  end

  def install
    bin.install "pdg"
  end

  test do
    assert_match "pdg", shell_output("#{bin}/pdg -version")
  end
end
