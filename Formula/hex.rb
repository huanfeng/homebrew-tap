class Hex < Formula
  desc "Base converter and calculator"
  homepage "https://github.com/huanfeng/hex"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huanfeng/hex/releases/download/v0.1.2/hex-0.1.2-macos-aarch64.tar.gz"
      sha256 "b68eefd6a07c0f39caf2805de97359102f087bb6a62e589da4b44fa627fdc206"
    else
      url "https://github.com/huanfeng/hex/releases/download/v0.1.2/hex-0.1.2-macos-x86_64.tar.gz"
      sha256 "8a887da6741e1ebf4b6b44bd5366f528226cf08a186532817cc6d9442ebe5a08"
    end
  end

  on_linux do
    url "https://github.com/huanfeng/hex/releases/download/v0.1.2/hex-0.1.2-linux-x86_64.tar.gz"
    sha256 "911dc75f3ea5b36a4705784f2447ff2ce1f4f579155d0887d14358616230f611"
  end

  def install
    bin.install "hex"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hex --version")
  end
end
