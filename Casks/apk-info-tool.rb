cask "apk-info-tool" do
  version "0.0.0"
  sha256 "REPLACE_ME"

  url "https://github.com/huanfeng/ApkInfoTool/releases/download/v#{version}/APKInfoTool-#{version}.dmg"
  name "APK Info Tool"
  homepage "https://github.com/huanfeng/ApkInfoTool"

  app "apk_info_tool.app"
end
