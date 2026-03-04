class ApkInfoTool < Formula
  desc "A simple tool for viewing APK/XAPK/APKM file information"
  homepage "https://github.com/huanfeng/ApkInfoTool"
  version "1.9.1"
  license "MIT"

  on_macos do
    url "https://github.com/huanfeng/ApkInfoTool/releases/download/v1.9.1/APKInfoTool-1.9.1.dmg"
    sha256 "07eb2705d567ab1fa634d95408236b19cb31eb12e559f340551e6bcd4a5af1d2"

    def install
      prefix.install "apk_info_tool.app"
      bin.write_exec_script prefix/"apk_info_tool.app/Contents/MacOS/apk_info_tool"
    end
  end

  on_linux do
    url "https://github.com/huanfeng/ApkInfoTool/releases/download/v1.9.1/APKInfoTool-1.9.1-x86_64.AppImage"
    sha256 "b6a0e55cff0f7a1a4cd90baf71ad1735beee4e2236fa256f45cd18793787a189"

    def install
      bin.install "APKInfoTool-1.9.1-x86_64.AppImage" => "apk-info-tool"
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
