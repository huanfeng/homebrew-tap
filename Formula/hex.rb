# This file is auto-generated. Do not edit manually.
class Hex < Formula
  desc "Base converter and calculator"
  homepage "https://github.com/huanfeng/hex"
  version "0.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huanfeng/hex/releases/download/v#{version}/hex-#{version}-macos-aarch64.tar.gz"
      sha256 "REPLACE_ME"
    else
      url "https://github.com/huanfeng/hex/releases/download/v#{version}/hex-#{version}-macos-x86_64.tar.gz"
      sha256 "REPLACE_ME"
    end
  end

  on_linux do
    url "https://github.com/huanfeng/hex/releases/download/v#{version}/hex-#{version}-linux-x86_64.tar.gz"
    sha256 "REPLACE_ME"
  end

  def install
    bin.install "hex"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hex --version")
  end
end
