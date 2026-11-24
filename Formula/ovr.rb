# typed: false
# frozen_string_literal: true

class Ovr < Formula
  desc "CLI tool to pipe anything into and apply transformations with an advanced UI"
  homepage "https://github.com/akhenakh/ovr"
  # Apple Silicon is the default; on_intel overrides it.
  url "https://github.com/akhenakh/ovr/releases/download/v0.7/ovr_Darwin_arm64.tar.gz"
  sha256 "21905c844f206366c6dc3c24b42a979386b5f517772ea789b21a343a7c274145"
  license "MIT"

  # Homebrew on Linux is not supported; Linux users install the release
  # tarball directly.
  depends_on :macos

  on_macos do
    on_arm do
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

  def install
    bin.install "ovr"
    resource("ovrui").stage { bin.install "ovrui" } if Hardware::CPU.arm?
  end

  test do
    assert_match "flag provided but not defined", shell_output("#{bin}/ovr -bogus 2>&1", 2)
  end
end
