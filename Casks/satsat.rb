# typed: false
# frozen_string_literal: true

cask "satsat" do
  version "0.6.2"
  sha256 arm:   "356ef2ac708f3bb6afc34084713a5686925e5167870aa21c8eb02cebe91afd10",
         intel: "13fad062efd03e38ec1ce82d012e83d914ffe09ca2641b256ea2952a516b40ea"

  on_arm do
    url "https://github.com/akhenakh/gosatsat/releases/download/v#{version}/satsat_#{version}_Darwin_arm64.tar.gz"
  end
  on_intel do
    url "https://github.com/akhenakh/gosatsat/releases/download/v#{version}/satsat_#{version}_Darwin_x86_64.tar.gz"
  end

  name "SatSat"
  desc "Native satellite pass tracker"
  homepage "https://github.com/akhenakh/gosatsat"

  depends_on :macos

  app "SatSat.app"

  # The release bundle is unsigned and un-notarised. Homebrew quarantines cask
  # downloads, and Gatekeeper then refuses to launch it; an ad-hoc signature
  # alone does not satisfy notarisation. Give the app a stable ad-hoc identity
  # and clear Homebrew's quarantine flag so it launches.
  postflight_steps do
    run "/usr/bin/codesign", args: ["--force", "--sign", "-", "{{appdir}}/SatSat.app"]
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/SatSat.app"]
  end
end
