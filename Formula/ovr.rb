# typed: false
# frozen_string_literal: true

class Ovr < Formula
  desc "CLI tool to pipe anything into and apply transformations with an advanced UI"
  homepage "https://github.com/akhenakh/ovr"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.3/ovr_Darwin_arm64.tar.gz"
      sha256 "2473e438bacaa904a40bdbf8e9c283d2ad02861d47afadb2138fcf3cb9b6c8d9"
      resource "ovrui" do
        version "v0.3"
        url "https://github.com/akhenakh/ovr/releases/download/v0.3/ovrui_Darwin_arm64.tar.gz"
        sha256 "4fcfec5e0b567e8609bf27ffe67c921962d37c62edbef0f621b762eaf7413fe4"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.3/ovr_Darwin_x86_64.tar.gz"
      sha256 "dbd7f91d567e94dfaa5190563ac665c078abb0204a757abba6ceb6bf337f316f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.3/ovr_Linux_arm64.tar.gz"
      sha256 "bebef49ddb449b5740d5d8490083390c77275891e9901169429bf1020b4d0412"
      resource "ovrui" do
        version "v0.3"
        url "https://github.com/akhenakh/ovr/releases/download/v0.3/ovrui_Linux_arm64.tar.gz"
        sha256 "47990f7cd2cf66f2c3bdc1e9abedc10786e4600d9b1098400a9dba9cca76fb63"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.3/ovr_Linux_x86_64.tar.gz"
      sha256 "8dcc09506da169c3ee944ef1908c0798be5d47297819522e59a53b4a0e8a489f"
      resource "ovrui" do
        version "v0.3"
        url "https://github.com/akhenakh/ovr/releases/download/v0.3/ovrui_Linux_x86_64.tar.gz"
        sha256 "b7fadb4af67aa1c87446b70b3e1c6e2018d2827e9a2646bc22f6a64af5c8a10d"
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
