# typed: false
# frozen_string_literal: true

class Vduck < Formula
  desc "Simple terminal UI for DuckDB"
  homepage "https://github.com/akhenakh/vduck"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/vduck/releases/download/v1.2.4/vduck_Darwin_arm64.tar.gz"
      sha256 "8bac67b46a5447d4f56408827fa72ad7aa54ed1f5510fd1bb3163f1b1e9d9a74"
    end
    on_intel do
      url "https://github.com/akhenakh/vduck/releases/download/v1.2.4/vduck_Darwin_x86_64.tar.gz"
      sha256 "689858553256df3bbd5c70efc9b93ce7abd657b645372368a914579e5d08f992"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/vduck/releases/download/v1.2.4/vduck_Linux_arm64.tar.gz"
      sha256 "4b2baad9c97fe875889235b0548c0869e957cc2bbd24ee1bbcf8858e4935d677"
    end
    on_intel do
      url "https://github.com/akhenakh/vduck/releases/download/v1.2.4/vduck_Linux_x86_64.tar.gz"
      sha256 "dcb5bdc36e2ddcf88e3317ab8ca3ac91e6aa5c7a200f22989106be0ea24de4b7"
    end
  end

  def install
    bin.install "vduck"
  end
end
