class ApkInfoTool < Formula
  desc "A simple tool for viewing APK/XAPK/APKM file information"
  homepage "https://github.com/huanfeng/ApkInfoTool"
  version "1.6.3"
  license "MIT"

  on_macos do
    url "https://github.com/huanfeng/ApkInfoTool/releases/download/v1.6.3/APKInfoTool-1.6.3.dmg"
    sha256 "b7643d35f6adb90c11cf051d690b4b69cd39b5b4f8f0fc948819fab56b21b113"

    def install
      prefix.install "apk_info_tool.app"
      bin.write_exec_script prefix/"apk_info_tool.app/Contents/MacOS/apk_info_tool"
    end
  end

  on_linux do
    url "https://github.com/huanfeng/ApkInfoTool/releases/download/v1.6.3/APKInfoTool-1.6.3-x86_64.AppImage"
    sha256 "4e23462f39d097b94d2d6e901865d5abbb174c0d8c81992cd4957db50fc462fd"

    def install
      bin.install "APKInfoTool-1.6.3-x86_64.AppImage" => "apk-info-tool"
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
