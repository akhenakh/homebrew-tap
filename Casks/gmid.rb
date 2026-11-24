# typed: false
# frozen_string_literal: true

cask "gmid" do
  version "0.2.4"
  sha256 arm:   "1706a3d2057eff716ff44410786b5413fd0eb6fd350fe0bad297fbe3403d9f08",
         intel: "34e6efbe2fc4a39bcce1c570953b6d1245e3b249ce277882891c8ee7df6e7bdb"

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
