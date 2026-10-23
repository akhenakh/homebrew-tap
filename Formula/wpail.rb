# typed: false
# frozen_string_literal: true

class Wpail < Formula
  desc "Find what application is listening on a TCP/UDP port"
  homepage "https://github.com/akhenakh/wpail"
  # Fallback for contexts with no dedicated build — there is no Darwin
  # x86_64 tarball since wpail is arm64-only on macOS by design.
  url "https://github.com/akhenakh/wpail/releases/download/v0.2/wpail_Linux_x86_64.tar.gz"
  sha256 "eccfdb5cffc0c13800176279518b3261a6c1837144d222aa7a6412ba55e703c9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/wpail/releases/download/v0.2/wpail_Darwin_arm64.tar.gz"
      sha256 "9adf4bd02d88510db9cd943ffd63b314d2ddd589138393362b2e3453fbfe401a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/wpail/releases/download/v0.2/wpail_Linux_arm64.tar.gz"
      sha256 "a5d814b86c3fa1f125093ac71cde03bf0a25c9045d148d0e361a8d3a040042d9"
    end
  end

  def install
    bin.install "wpail"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/wpail -h 2>&1")
  end
end
