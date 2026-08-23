# typed: false
# frozen_string_literal: true

class Vduck < Formula
  desc "Simple terminal UI for DuckDB"
  homepage "https://github.com/akhenakh/vduck"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/vduck/releases/download/v1.2.3/vduck_Darwin_arm64.tar.gz"
      sha256 "cc609f4e1253ec296407d077945bd5caa472aeb48a3c11d78a7df24b8844731d"
    end
    on_intel do
      url "https://github.com/akhenakh/vduck/releases/download/v1.2.3/vduck_Darwin_x86_64.tar.gz"
      sha256 "77dfb283642b55cef406bdf235155eea2c04ee5ed2b6f83d72696914f149ca52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/vduck/releases/download/v1.2.3/vduck_Linux_arm64.tar.gz"
      sha256 "d9e09189a61bbc8bb23dbd4ac32e765c35e8038c04b7a624cf4937b85d5a7ce8"
    end
    on_intel do
      url "https://github.com/akhenakh/vduck/releases/download/v1.2.3/vduck_Linux_x86_64.tar.gz"
      sha256 "4b36fa544b3da62d65da90d7f00f1d814f165aae27ae7dc681322a47103029ec"
    end
  end

  def install
    bin.install "vduck"
  end
end
