# typed: false
# frozen_string_literal: true

class Wpail < Formula
  desc "Find what application is listening on a TCP/UDP port"
  homepage "https://github.com/akhenakh/wpail"
  # There is no Darwin x86_64 tarball since wpail is arm64-only on macOS by
  # design.
  url "https://github.com/akhenakh/wpail/releases/download/v0.4/wpail_Darwin_arm64.tar.gz"
  sha256 "04d7f54ad4824a4eea665d7794cc774358fc51ebc8489b22db1c09c4ba586803"
  license "MIT"

  # Homebrew on Linux is not supported; Linux users install the release
  # tarball directly.
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "wpail"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/wpail -h 2>&1")
  end
end
