# typed: false
# frozen_string_literal: true

cask "satsat" do
  version "0.5"
  sha256 arm:   "e8c2dbf6db15398ff46d630c15cb21299318fbc87b38f54bbb8b0e80b6235cb1",
         intel: "96f3b687b6ce5ecf50dc9aaeeb7740e2e489a01d88ff1887c533e24072d40926"

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
