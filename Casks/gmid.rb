# typed: false
# frozen_string_literal: true

cask "gmid" do
  version "0.1"
  sha256 arm:   "34044ad6b8937d90938ef405ca3a92b87b846fc787d85c2b6c7ebc182a85508f",
         intel: "5253f32815d89a75ca3b0723bc15142cfe34177d08a49f205d6c85adeee00289"

  on_arm do
    url "https://github.com/akhenakh/gmid/releases/download/v#{version}/gmid_#{version}_Darwin_arm64.tar.gz"
  end
  on_intel do
    url "https://github.com/akhenakh/gmid/releases/download/v#{version}/gmid_#{version}_Darwin_x86_64.tar.gz"
  end

  name "gmid"
  desc "MIDI player and editor with a falling-note piano roll"
  homepage "https://github.com/akhenakh/gmid"

  depends_on :macos

  app "gmid.app"

  # The release bundle is unsigned and un-notarised. Homebrew quarantines cask
  # downloads, and Gatekeeper then refuses to launch it; an ad-hoc signature
  # alone does not satisfy notarisation. Give the app a stable ad-hoc identity
  # and clear Homebrew's quarantine flag so it launches.
  postflight_steps do
    run "/usr/bin/codesign", args: ["--force", "--sign", "-", "{{appdir}}/gmid.app"]
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/gmid.app"]
  end
end
