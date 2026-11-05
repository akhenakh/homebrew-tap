# typed: false
# frozen_string_literal: true

class Wpail < Formula
  desc "Find what application is listening on a TCP/UDP port"
  homepage "https://github.com/akhenakh/wpail"
  # Fallback for contexts with no dedicated build — there is no Darwin
  # x86_64 tarball since wpail is arm64-only on macOS by design.
  url "https://github.com/akhenakh/wpail/releases/download/v0.3/wpail_Linux_x86_64.tar.gz"
  sha256 "56fec9d7dacf251aec67992b65aa5e4a4777a2a5294ccc5d16a5b16bf03eddb3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/wpail/releases/download/v0.3/wpail_Darwin_arm64.tar.gz"
      sha256 "1c7dd3190d6d7edc51f3d36fb146c86874154898a76924b6209087a829f8cf45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/wpail/releases/download/v0.3/wpail_Linux_arm64.tar.gz"
      sha256 "1ff19b9b9fda7bd95524a81397fbe7aa6dd91525d27925a465cfd948dfc85a4d"
    end
  end

  def install
    bin.install "wpail"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/wpail -h 2>&1")
  end
end
