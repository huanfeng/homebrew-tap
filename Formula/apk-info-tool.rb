class ApkInfoTool < Formula
  desc "A simple tool for viewing APK/XAPK/APKM file information"
  homepage "https://github.com/huanfeng/ApkInfoTool"
  version "2.1.8"
  license "MIT"

  on_macos do
    url "https://github.com/huanfeng/ApkInfoTool/releases/download/v2.1.8/APKInfoTool-2.1.8.dmg"
    sha256 "d93b42e017d3c135b2c9169e553a9a6270955cc6d27c381637949496a8dbaabe"

    def install
      prefix.install "apk_info_tool.app"
      bin.write_exec_script prefix/"apk_info_tool.app/Contents/MacOS/apk_info_tool"
    end
  end

  on_linux do
    url "https://github.com/huanfeng/ApkInfoTool/releases/download/v2.1.8/APKInfoTool-2.1.8-x86_64.AppImage"
    sha256 "7c7012323e1c840d990a013e6326fe8fc271dad83c061f4101531aaa5565aa57"

    def install
      bin.install "APKInfoTool-2.1.8-x86_64.AppImage" => "apk-info-tool"
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
