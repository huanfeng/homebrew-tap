class ApkInfoTool < Formula
  desc "A simple tool for viewing APK/XAPK/APKM file information"
  homepage "https://github.com/huanfeng/ApkInfoTool"
  version "1.7.2"
  license "MIT"

  on_macos do
    url "https://github.com/huanfeng/ApkInfoTool/releases/download/v1.7.2/APKInfoTool-1.7.2.dmg"
    sha256 "6b1ab12d40315881152ecd18c76df7c4f171382fe65392fa58f075bcfa175255"

    def install
      prefix.install "apk_info_tool.app"
      bin.write_exec_script prefix/"apk_info_tool.app/Contents/MacOS/apk_info_tool"
    end
  end

  on_linux do
    url "https://github.com/huanfeng/ApkInfoTool/releases/download/v1.7.2/APKInfoTool-1.7.2-x86_64.AppImage"
    sha256 "b1e2950078eccac860f3d50905d7e63c8a805a41dbe9f33417a79d2623d6818d"

    def install
      bin.install "APKInfoTool-1.7.2-x86_64.AppImage" => "apk-info-tool"
      chmod 0755, bin/"apk-info-tool"
    end
  end

  def caveats
    on_linux do
      <<~EOS
        Note: This installs an AppImage. You may need FUSE to run it:
          sudo apt install fuse libfuse2  # Debian/Ubuntu
          sudo dnf install fuse fuse-libs # Fedora
      EOS
    end
  end

  test do
    assert_predicate bin/"apk-info-tool", :exist?
  end
end
