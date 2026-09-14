# typed: false
# frozen_string_literal: true

class Ovr < Formula
  desc "CLI tool to pipe anything into and apply transformations with an advanced UI"
  homepage "https://github.com/akhenakh/ovr"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.4/ovr_Darwin_arm64.tar.gz"
      sha256 "c1854342d97899a5ccdeeac74dd3884fc415b05e83346027ea34e1728aac686b"
      resource "ovrui" do
        version "v0.4"
        url "https://github.com/akhenakh/ovr/releases/download/v0.4/ovrui_Darwin_arm64.tar.gz"
        sha256 "1eb2be6b82ab3b9129e59d84d3ec35f97c5abb76b33d8bd04cd6e4276b80eeec"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.4/ovr_Darwin_x86_64.tar.gz"
      sha256 "9f11fb84f9512066476eb050d757cf8b5f2e37977a873d6d21d158c7e4498c6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.4/ovr_Linux_arm64.tar.gz"
      sha256 "183d8d9f83e87cd4a1fb91c703d244bffaa2c3390866bfeb9e8937bfb791e233"
      resource "ovrui" do
        version "v0.4"
        url "https://github.com/akhenakh/ovr/releases/download/v0.4/ovrui_Linux_arm64.tar.gz"
        sha256 "8de9809c3f35ef148f5cfb79a3023c2f0f94fe779586c17d78ba6e3ed6d9121d"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.4/ovr_Linux_x86_64.tar.gz"
      sha256 "e6b320b6788a65a92a5e641b44cc63dda7f7f82d848b513067f243a347181e11"
      resource "ovrui" do
        version "v0.4"
        url "https://github.com/akhenakh/ovr/releases/download/v0.4/ovrui_Linux_x86_64.tar.gz"
        sha256 "ebb4c4d55fe6bb21af833ce6c4a374647fd4dd2d8342a27dbb1fade6e1806d76"
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
