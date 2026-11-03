# typed: false
# frozen_string_literal: true

cask "gmid" do
  version "0.2"
  sha256 arm:   "e36a235a12f406b1731f3a0e368962a49374c2e74aecf064af5f0aa29f3801b4",
         intel: "2e7b5a01e3bfec0bb7d916aebc58398c892381b3eb03402b696e7f445cc6cf89"

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
