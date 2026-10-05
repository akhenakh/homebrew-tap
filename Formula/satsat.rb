# typed: false
# frozen_string_literal: true

class Satsat < Formula
  desc "Native satellite pass tracker"
  homepage "https://github.com/akhenakh/gosatsat"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.3/satsat_0.3_Darwin_arm64.tar.gz"
      sha256 "53a7905678536b29229eb16e50ed78d4b1e5075faac9fdfdc83277b3796d291b"
    end
    on_intel do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.3/satsat_0.3_Darwin_x86_64.tar.gz"
      sha256 "97032a8c473007f60212d65e5f25379b8f887bdd5f65cbff69b4fdf735a746a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.3/satsat_0.3_Linux_arm64.tar.gz"
      sha256 "0771211b0cb7e7a7a098fa924c6dcc98434d79001c6a99e94dfd0ebeff3b49f8"
    end
    on_intel do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.3/satsat_0.3_Linux_x86_64.tar.gz"
      sha256 "a30de4d71fecc80ce47d3ff0d1d52e719f2379476b2f24f763a3368fd166c868"
    end
  end

  def install
    # app.ResourcePath resolves <exeDir>/Resources, so keep both together.
    libexec.install "satsat"
    libexec.install "Resources"
    bin.install_symlink libexec/"satsat"
  end

  test do
    system "#{bin}/satsat", "--help"
  end
end
