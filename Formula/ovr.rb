# typed: false
# frozen_string_literal: true

class Ovr < Formula
  desc "CLI tool to pipe anything into and apply transformations with an advanced UI"
  homepage "https://github.com/akhenakh/ovr"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.5/ovr_Darwin_arm64.tar.gz"
      sha256 "8d8194399545bfaf183ee61bb3c7566bd51e3e99f2618e31db9c5dd13a61e8b8"
      resource "ovrui" do
        version "v0.5"
        url "https://github.com/akhenakh/ovr/releases/download/v0.5/ovrui_Darwin_arm64.tar.gz"
        sha256 "a94d7b989ae6ec008e7088afab0dff9f4731e5721642479f5a135c51b3404c84"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.5/ovr_Darwin_x86_64.tar.gz"
      sha256 "2b5d411154b615ecd8f06d45a0d08acbd258e2cbb3288a48d59e9664454db00c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.5/ovr_Linux_arm64.tar.gz"
      sha256 "91affb3c8e274ae79ad0edd2fbb5a8d1628d3a7d16297507cf156615f1ce0f19"
      resource "ovrui" do
        version "v0.5"
        url "https://github.com/akhenakh/ovr/releases/download/v0.5/ovrui_Linux_arm64.tar.gz"
        sha256 "8b4151cf44e4769431ef8891c9c71d4efd95317b076a7432bc90740e9433b2a0"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.5/ovr_Linux_x86_64.tar.gz"
      sha256 "645c2ba4682cfaa37803d121b40509dac522fbcd48d4281997db0a3853b0ae6e"
      resource "ovrui" do
        version "v0.5"
        url "https://github.com/akhenakh/ovr/releases/download/v0.5/ovrui_Linux_x86_64.tar.gz"
        sha256 "64318f1e3c8261bd2a1ea9f118eeb6a8602cc678a38885b3d3cb0bc6b5f29107"
      end
    end
  end

  def install
    bin.install "ovr"
    if OS.mac? && Hardware::CPU.arm?
      resource("ovrui").stage { bin.install "ovrui" }
    elsif OS.linux?
      resource("ovrui").stage { bin.install "ovrui" }
    end
  end
end
