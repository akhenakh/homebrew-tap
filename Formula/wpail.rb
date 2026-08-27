# typed: false
# frozen_string_literal: true

class Wpail < Formula
  desc "Find what application is listening on a TCP/UDP port"
  homepage "https://github.com/akhenakh/wpail"
  # Fallback for contexts with no dedicated build — there is no Darwin
  # x86_64 tarball since wpail is arm64-only on macOS by design.
  url "https://github.com/akhenakh/wpail/releases/download/v0.1/wpail_Linux_x86_64.tar.gz"
  sha256 "e824295bd9402625fbf46a2fca0d04caaf0c49da47a797910ae277a36d54b437"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/wpail/releases/download/v0.1/wpail_Darwin_arm64.tar.gz"
      sha256 "041d7981de3f7761b786ea680c904e86380efce7eaef7d97ab1ca2d281758dec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/wpail/releases/download/v0.1/wpail_Linux_arm64.tar.gz"
      sha256 "f4fce20bc837ebe73737e45ba0a34a95322db2b40ceb3ab572554ac5642798a6"
    end
  end

  def install
    bin.install "wpail"
  end
end
