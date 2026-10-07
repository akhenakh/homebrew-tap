# typed: false
# frozen_string_literal: true

cask "satsat" do
  version "0.4"
  sha256 arm:   "6a09757fc9343b224a7c13929f8687f24d350bba455795f37da7a496c9877d5c",
         intel: "bdb1e5db82f6930625e3839c189d27d2fded7e59376e1b7d72a8c8a74f42d9d1"

  on_arm do
    url "https://github.com/akhenakh/gosatsat/releases/download/v0.4/satsat_0.4_Darwin_arm64.tar.gz"
  end
  on_intel do
    url "https://github.com/akhenakh/gosatsat/releases/download/v0.4/satsat_0.4_Darwin_x86_64.tar.gz"
  end

  name "SatSat"
  desc "Native satellite pass tracker"
  homepage "https://github.com/akhenakh/gosatsat"

  depends_on macos: ">= :big_sur"

  app "SatSat.app"
end
