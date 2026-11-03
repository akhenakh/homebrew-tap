# typed: false
# frozen_string_literal: true

cask "gmid" do
  version "0.2.2"
  sha256 arm:   "b6dba8bb23ace459d2524b05e2c29272011bc7363de0d622ce2a76a8387cf232",
         intel: "5eb1d01d4669d11840af0ce75afb199c2daf0af5fb9023198ad903295bcdb6aa"

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
