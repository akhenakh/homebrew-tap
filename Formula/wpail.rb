# typed: false
# frozen_string_literal: true

class Wpail < Formula
  desc "Find what application is listening on a TCP/UDP port"
  homepage "https://github.com/akhenakh/wpail"
  # Fallback for contexts with no dedicated build — there is no Darwin
  # x86_64 tarball since wpail is arm64-only on macOS by design.
  url "https://github.com/akhenakh/wpail/releases/download/v0.4/wpail_Linux_x86_64.tar.gz"
  sha256 "675f2c899345000e781a48a76b0297906d478a3efac05254278aa7ad53576c40"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/wpail/releases/download/v0.4/wpail_Darwin_arm64.tar.gz"
      sha256 "04d7f54ad4824a4eea665d7794cc774358fc51ebc8489b22db1c09c4ba586803"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/wpail/releases/download/v0.4/wpail_Linux_arm64.tar.gz"
      sha256 "cb87f2b604c0f73cfc7899adeb4ceb73a42052f29bbb61b818f777152ddc60e0"
    end
  end

  def install
    bin.install "wpail"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/wpail -h 2>&1")
  end
end
