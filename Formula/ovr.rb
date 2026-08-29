# typed: false
# frozen_string_literal: true

class Ovr < Formula
  desc "CLI tool to pipe anything into and apply transformations with an advanced UI"
  homepage "https://github.com/akhenakh/ovr"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.1/ovr_Darwin_arm64.tar.gz"
      sha256 "07c800178f4444b48bf2ec22dd2ad6c0e015aa85d0d73b8ba0fe3e458a5fc50a"
      resource "ovrui" do
        version "v0.1"
        url "https://github.com/akhenakh/ovr/releases/download/v0.1/ovrui_Darwin_arm64.tar.gz"
        sha256 "d9dd6d149c61a46591174a12e6eed0d34197551d4a2c557cac397f51ae53a407"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.1/ovr_Darwin_x86_64.tar.gz"
      sha256 "7be73b1e840e81dca277fe810e6bc0a401870d184dd7829c31fe826c9e67ca85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.1/ovr_Linux_arm64.tar.gz"
      sha256 "5db0873b36a6d39eff064fc43d490c8126d23ec64045688ad8198abf647e09d6"
      resource "ovrui" do
        version "v0.1"
        url "https://github.com/akhenakh/ovr/releases/download/v0.1/ovrui_Linux_arm64.tar.gz"
        sha256 "038966c2a03a19330d81045be2685e5765dc96ac73f91207229c8e3be1a9848b"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.1/ovr_Linux_x86_64.tar.gz"
      sha256 "2f3dba06e2354840bde7c32823620ac54ea829101dbea0d6067f7446facd3559"
      resource "ovrui" do
        version "v0.1"
        url "https://github.com/akhenakh/ovr/releases/download/v0.1/ovrui_Linux_x86_64.tar.gz"
        sha256 "596c99992aa81140566c6e71b6db157076e096363cddff04388be36e60c59fdc"
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
