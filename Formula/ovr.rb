# typed: false
# frozen_string_literal: true

class Ovr < Formula
  desc "CLI tool to pipe anything into and apply transformations with an advanced UI"
  homepage "https://github.com/akhenakh/ovr"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.2/ovr_Darwin_arm64.tar.gz"
      sha256 "19029080473a59b76072d926f886ec836e7ba0f35c385c0b8eec3dc3931e63cf"
      resource "ovrui" do
        version "v0.2"
        url "https://github.com/akhenakh/ovr/releases/download/v0.2/ovrui_Darwin_arm64.tar.gz"
        sha256 "6c1df88778aa4f02ff506fe72cf138cf1a4d229ac0954c758d419ab5f9672de3"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.2/ovr_Darwin_x86_64.tar.gz"
      sha256 "59d48fc0762281f013acbad33d0ac86a0e3ba7f918ad5d2dcf3e777eb1242543"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.2/ovr_Linux_arm64.tar.gz"
      sha256 "87bcfb1bd4ee4351e97c727b71b87a7cfe76b51e89051ae055264c43fd2d6de2"
      resource "ovrui" do
        version "v0.2"
        url "https://github.com/akhenakh/ovr/releases/download/v0.2/ovrui_Linux_arm64.tar.gz"
        sha256 "865e00a86cf40371554fc5f82d0c5a886f820efc13abdfb2e34aa7d813076961"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.2/ovr_Linux_x86_64.tar.gz"
      sha256 "4dc8cb85a0d6f7e3a9e8a210ca2c588a538aa683fdef9400500c458e9aad0e82"
      resource "ovrui" do
        version "v0.2"
        url "https://github.com/akhenakh/ovr/releases/download/v0.2/ovrui_Linux_x86_64.tar.gz"
        sha256 "7dbab0a401b49cb7cf1e9259b4f3abe1e68ea39dbea1d6bb0719428332c52001"
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
