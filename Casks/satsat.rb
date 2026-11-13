# typed: false
# frozen_string_literal: true

cask "satsat" do
  version "0.6.3"
  sha256 arm:   "9d2d7126db4be894da4356763736f266f6e0900df77f22e91baea62b609e83f6",
         intel: "dc78782649ff3c0fa7a5be967bd87743240cabb353fcd2d3b0309e47bbbfb62b"

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
