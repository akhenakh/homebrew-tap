# typed: false
# frozen_string_literal: true

class Ovr < Formula
  desc "CLI tool to pipe anything into and apply transformations with an advanced UI"
  homepage "https://github.com/akhenakh/ovr"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.2/ovr_Darwin_arm64.tar.gz"
      sha256 "9d8da42d2cac0662b948e658ab6b526876ef9797f5b5d4a081ae9f28d7e7c07f"
      resource "ovrui" do
        version "v0.2"
        url "https://github.com/akhenakh/ovr/releases/download/v0.2/ovrui_Darwin_arm64.tar.gz"
        sha256 "0f30564cfbfc4dbeaa5b4f4e5c7945f5a70d3ec5389f7f026d73eb3e51e2c328"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.2/ovr_Darwin_x86_64.tar.gz"
      sha256 "f544d4ebf594ad0a73c461c7aca40e90ea024bcd902c0ed146f00efb3626ab0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.2/ovr_Linux_arm64.tar.gz"
      sha256 "7b4f834e81329d6b6ce8494ba64e2730be066ade63f48b44ed29cd95798d55e8"
      resource "ovrui" do
        version "v0.2"
        url "https://github.com/akhenakh/ovr/releases/download/v0.2/ovrui_Linux_arm64.tar.gz"
        sha256 "b233568ddcdf108d3a20c76302c58507807bed4afea278e2b445988696eafbef"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.2/ovr_Linux_x86_64.tar.gz"
      sha256 "5caf06d276fa62e46a7ab97a1377aca43f5d6ec846efbd19a843af8a261c6405"
      resource "ovrui" do
        version "v0.2"
        url "https://github.com/akhenakh/ovr/releases/download/v0.2/ovrui_Linux_x86_64.tar.gz"
        sha256 "052f48614eb4480023301fdbb59a090bf07c1f1eec1a13d3a11c068f3c0707fb"
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
