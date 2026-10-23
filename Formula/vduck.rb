# typed: false
# frozen_string_literal: true

class Vduck < Formula
  desc "Simple terminal UI for DuckDB"
  homepage "https://github.com/akhenakh/vduck"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/vduck/releases/download/v1.2.5/vduck_Darwin_arm64.tar.gz"
      sha256 "3ca07b5adcd070afa66c8d0fa546ef4771f31d644f3e4e43cf0f1c7373bef2ba"
    end
    on_intel do
      url "https://github.com/akhenakh/vduck/releases/download/v1.2.5/vduck_Darwin_x86_64.tar.gz"
      sha256 "e3325a73f4446feadda3094216d4f94b8d0d6f2cbad300e0bb4b5bdf5f0241ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/vduck/releases/download/v1.2.5/vduck_Linux_arm64.tar.gz"
      sha256 "044f09f69f9fbf3777015bea6a8d7266d007d8dcfb7986f49bc25977b2146901"
    end
    on_intel do
      url "https://github.com/akhenakh/vduck/releases/download/v1.2.5/vduck_Linux_x86_64.tar.gz"
      sha256 "4b46e4df1dd9ca461cbeed8a0305234995ad9dbd8359c9ea7579407a1e7f72ed"
    end
  end

  def install
    bin.install "vduck"
  end

  test do
    assert_match "flag provided but not defined", shell_output("#{bin}/vduck -bogus 2>&1", 2)
  end
end
