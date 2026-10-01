# typed: false
# frozen_string_literal: true

class Ovr < Formula
  desc "CLI tool to pipe anything into and apply transformations with an advanced UI"
  homepage "https://github.com/akhenakh/ovr"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.6/ovr_Darwin_arm64.tar.gz"
      sha256 "8bb6ab1f5fd706d5c04e40897e7806bf60c9244fb42372b9bad05cd9145829a1"
      resource "ovrui" do
        version "v0.6"
        url "https://github.com/akhenakh/ovr/releases/download/v0.6/ovrui_Darwin_arm64.tar.gz"
        sha256 "bb1c194c7b63f4dbf29ceeeb2e52bfda01df990c1a39f36e91308d1028409ce4"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.6/ovr_Darwin_x86_64.tar.gz"
      sha256 "e54c04bd330b5b1a3ad82b477adf5917f1d456e736199a6133438e2cc201fc1d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/ovr/releases/download/v0.6/ovr_Linux_arm64.tar.gz"
      sha256 "21890a1e5b2861f9126d5ae26f5ca8819c494bfec5ca0550596e1e40c36358d9"
      resource "ovrui" do
        version "v0.6"
        url "https://github.com/akhenakh/ovr/releases/download/v0.6/ovrui_Linux_arm64.tar.gz"
        sha256 "9fdc3140eb4e5629a2d5bb7248033e2adae9e60e5bff5a78eca2232b1a0212af"
      end
    end
    on_intel do
      url "https://github.com/akhenakh/ovr/releases/download/v0.6/ovr_Linux_x86_64.tar.gz"
      sha256 "86276b28bad4e6fa2036665811b3917e1c3a9a67c14140afb854d1234716f98a"
      resource "ovrui" do
        version "v0.6"
        url "https://github.com/akhenakh/ovr/releases/download/v0.6/ovrui_Linux_x86_64.tar.gz"
        sha256 "c6b8c3be497798373f9002152cb6fb31f214c602b538c30ead30619f1b878803"
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
