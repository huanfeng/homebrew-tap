class ApkInfoTool < Formula
  desc "A simple tool for viewing APK/XAPK/APKM file information"
  homepage "https://github.com/huanfeng/ApkInfoTool"
  version "2.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/huanfeng/ApkInfoTool/releases/download/v2.1.0/APKInfoTool-2.1.0.dmg"
    sha256 "66ff5acd324bd24f9bc2d52476546d5a88fb7218f79174f3493fd9726d584a5b"

    def install
      prefix.install "apk_info_tool.app"
      bin.write_exec_script prefix/"apk_info_tool.app/Contents/MacOS/apk_info_tool"
    end
  end

  on_linux do
    url "https://github.com/huanfeng/ApkInfoTool/releases/download/v2.1.0/APKInfoTool-2.1.0-x86_64.AppImage"
    sha256 "8a0e3f1ab51495c92831ae6a56cacc66e746c71e447bf6ccc114ba4d03bbda38"

    def install
      bin.install "APKInfoTool-2.1.0-x86_64.AppImage" => "apk-info-tool"
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
