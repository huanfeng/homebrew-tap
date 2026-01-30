class ApkInfoTool < Formula
  desc "A simple tool for viewing APK/XAPK/APKM file information"
  homepage "https://github.com/huanfeng/ApkInfoTool"
  version "1.6.4"
  license "MIT"

  on_macos do
    url "https://github.com/huanfeng/ApkInfoTool/releases/download/v1.6.4/APKInfoTool-1.6.4.dmg"
    sha256 "749827f2d7e87201e91819857108a50e17a7150d56abdd9812ca65389237e9b0"

    def install
      prefix.install "apk_info_tool.app"
      bin.write_exec_script prefix/"apk_info_tool.app/Contents/MacOS/apk_info_tool"
    end
  end

  on_linux do
    url "https://github.com/huanfeng/ApkInfoTool/releases/download/v1.6.4/APKInfoTool-1.6.4-x86_64.AppImage"
    sha256 "c9d4e07d0aa3392308bfb3e39cbe441f135dd7dff19bf04b65eb9b503acb19a5"

    def install
      bin.install "APKInfoTool-1.6.4-x86_64.AppImage" => "apk-info-tool"
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
