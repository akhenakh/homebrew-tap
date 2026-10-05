# typed: false
# frozen_string_literal: true

class Satsat < Formula
  desc "Native satellite pass tracker"
  homepage "https://github.com/akhenakh/gosatsat"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.2/satsat_0.2_Darwin_arm64.tar.gz"
      sha256 "7e492539e5932748b77164afc1ba22ac556a63aedc53e93b575745e745ec9d2a"
    end
    on_intel do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.2/satsat_0.2_Darwin_x86_64.tar.gz"
      sha256 "88d9493d7eb659df9ee52babeb299916cb7953a9f8cd7484d25837c18f25e762"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.2/satsat_0.2_Linux_arm64.tar.gz"
      sha256 "9a4634d827f4a538673fab6f817c7af4f022ba361e73c115d485abdb760e84a2"
    end
    on_intel do
      url "https://github.com/akhenakh/gosatsat/releases/download/v0.2/satsat_0.2_Linux_x86_64.tar.gz"
      sha256 "5bb8183aaf2eaa06787c1af35f46d3cdf4a63069dff196d980c57f5fbea01ab2"
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
