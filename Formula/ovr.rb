# typed: false
# frozen_string_literal: true

class Ovr < Formula
  desc "CLI tool to pipe anything into and apply transformations with an advanced UI"
  homepage "https://github.com/akhenakh/ovr"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.7/ovr_Darwin_arm64.tar.gz"
      sha256 "21905c844f206366c6dc3c24b42a979386b5f517772ea789b21a343a7c274145"
      resource "ovrui" do
        version "v0.7"
        url "https://github.com/akhenakh/ovr/releases/download/v0.7/ovrui_Darwin_arm64.tar.gz"
        sha256 "0ebc0e83d0d631b75913a60c865cce02f740a5175abda05e0e007974a3c5328a"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.7/ovr_Darwin_x86_64.tar.gz"
      sha256 "08a888155f793d2ae02cf9270a91739ae0c081ca0575ad0792ed416f18db6f95"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.7/ovr_Linux_arm64.tar.gz"
      sha256 "c75d51084a49ca2d0093af3702d4205f07309ee0883e8c4ffec9d0c01e6678bd"
      resource "ovrui" do
        version "v0.7"
        url "https://github.com/akhenakh/ovr/releases/download/v0.7/ovrui_Linux_arm64.tar.gz"
        sha256 "a84a98e86c3485bc8f793e6c52005e97e26d6cfb12873cc14305470150a664d1"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.7/ovr_Linux_x86_64.tar.gz"
      sha256 "7b87cd5dc09c08c47b972188cb9766d3ea95304188c604e412a6035e8535bf4a"
      resource "ovrui" do
        version "v0.7"
        url "https://github.com/akhenakh/ovr/releases/download/v0.7/ovrui_Linux_x86_64.tar.gz"
        sha256 "ed062636804ecc9563b7420f22b5b581a15262d3f81718e539b5f54cd851b8f1"
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
