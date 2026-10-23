# typed: false
# frozen_string_literal: true

class Ovr < Formula
  desc "CLI tool to pipe anything into and apply transformations with an advanced UI"
  homepage "https://github.com/akhenakh/ovr"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.6.1/ovr_Darwin_arm64.tar.gz"
      sha256 "8509188093cf0ba302217ede85397652c2f3b44e39daa874cbba1c110429f30b"
      resource "ovrui" do
        version "v0.6.1"
        url "https://github.com/akhenakh/ovr/releases/download/v0.6.1/ovrui_Darwin_arm64.tar.gz"
        sha256 "030bab438e85aaf31db771c64abaeb998da5c7f46b691d6f5f7bf9b02a0c1910"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.6.1/ovr_Darwin_x86_64.tar.gz"
      sha256 "9562cd9d2d2fe15bb47733f7605a8a6b08072a91726c2f54c768fd00b36192cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.6.1/ovr_Linux_arm64.tar.gz"
      sha256 "1ebd4d7989f390ba522d24a4b8cd4766b0eb861e88d2e6ddf8355e06e6234e5b"
      resource "ovrui" do
        version "v0.6.1"
        url "https://github.com/akhenakh/ovr/releases/download/v0.6.1/ovrui_Linux_arm64.tar.gz"
        sha256 "412429f2df45ca0db977e3e503fe89a8081ced5d78b0f18a4deba23651275d2a"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.6.1/ovr_Linux_x86_64.tar.gz"
      sha256 "46657040f210cfd5d3eabfe720f5c3273d22d3eab02bb89588e1053b136fc3ac"
      resource "ovrui" do
        version "v0.6.1"
        url "https://github.com/akhenakh/ovr/releases/download/v0.6.1/ovrui_Linux_x86_64.tar.gz"
        sha256 "e0a5179e1f848ec84c83e21007a2ec97e0124af1ff20701cdf700c4f6f7ff0c5"
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

  test do
    assert_match "flag provided but not defined", shell_output("#{bin}/ovr -bogus 2>&1", 2)
  end
end
