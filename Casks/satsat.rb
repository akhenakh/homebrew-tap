# typed: false
# frozen_string_literal: true

cask "satsat" do
  version "0.6.1"
  sha256 arm:   "a4208dc22a131f9149946eb1bbd36cfe6f561c987fd03c0895bf65df06ab9162",
         intel: "f5e284a7df235cb0a87d385ee53df4a8b720556bf6afcc6f4a7f40d611f0ba31"

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
