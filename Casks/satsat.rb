# typed: false
# frozen_string_literal: true

cask "satsat" do
  version "0.6"
  sha256 arm:   "9c1db176362a135b3694f9bc3b40276f901333b70bacdb92ad304bc7538b062d",
         intel: "1d9e990dae0ab6ed2f1ff78ab07b405cf5b2011d6a0b85a14ef64b1b2fddcaba"

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
