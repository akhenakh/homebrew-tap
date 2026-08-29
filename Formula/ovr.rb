# typed: false
# frozen_string_literal: true

class Ovr < Formula
  desc "CLI tool to pipe anything into and apply transformations with an advanced UI"
  homepage "https://github.com/akhenakh/ovr"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.1/ovr_Darwin_arm64.tar.gz"
      sha256 "b725f4a50666d444c08ff08d819c3aeaac859fa4d989d2cd6f87452b2928cfdd"
      resource "ovrui" do
        version "v0.1"
        url "https://github.com/akhenakh/ovr/releases/download/v0.1/ovrui_Darwin_arm64.tar.gz"
        sha256 "a140ffa2ddf76d3b55d7b20214999a918b5b14ebb0836af95cf994c9fe24d78d"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.1/ovr_Darwin_x86_64.tar.gz"
      sha256 "26c017f01d6e4d59181191ab1a003a6eabaf942169c9c8056a129893063f1ae9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.1/ovr_Linux_arm64.tar.gz"
      sha256 "e167aca74ca900cca3f18ad4980eacf7d041d67d22b883ec5015cdc2a244c65e"
      resource "ovrui" do
        version "v0.1"
        url "https://github.com/akhenakh/ovr/releases/download/v0.1/ovrui_Linux_arm64.tar.gz"
        sha256 "66b5f53794d370abb95611927077a1656b17e44d5160708c9b14d7e164752eca"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.1/ovr_Linux_x86_64.tar.gz"
      sha256 "68934bb7c59d69ff01b2222c05c09791d95cee3bedbc7062a304b577748692e0"
      resource "ovrui" do
        version "v0.1"
        url "https://github.com/akhenakh/ovr/releases/download/v0.1/ovrui_Linux_x86_64.tar.gz"
        sha256 "77d627e04d501640866c0a6367485cb37781716d64fdf15f6dfaa031babfbaa3"
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
