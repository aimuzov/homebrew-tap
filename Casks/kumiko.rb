cask "kumiko" do
  version "0.4.1"
  sha256 "04473e17e9f5fdeec802bbcbce52e9fbc05bf28f8a8aa2cb5c14428f77063032"

  url "https://github.com/aimuzov/kumiko/releases/download/v#{version}/Kumiko-#{version}.zip"
  name "kumiko"
  desc "Tiling window manager with workspaces, hotkeys and a status bar"
  homepage "https://github.com/aimuzov/kumiko"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Kumiko.app"
  binary "#{appdir}/Kumiko.app/Contents/MacOS/kumiko"

  # The app is not notarized yet: without this macOS refuses to open it the first time.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Kumiko.app"]
  end

  uninstall quit: "online.aimuzov.kumiko"

  zap trash: [
    "~/.cache/kumiko-state.json",
    "~/.cache/kumiko.sock",
    "~/.config/kumiko",
    "~/Library/Preferences/online.aimuzov.kumiko.plist",
  ]
end
