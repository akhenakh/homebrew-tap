# typed: false
# frozen_string_literal: true

cask "gmid" do
  version "0.2.1"
  sha256 arm:   "a1d6a1283bae9a3af1446e7643f76eb2a3a093d8fc66211008b226f1af5374d1",
         intel: "120ddd352b79a55b928af6676705b72cd5eb9056f19185e0d2e7ff7aa7d7f236"

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
