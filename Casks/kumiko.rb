cask "kumiko" do
  version "0.4.2"
  sha256 "98ef5d009d95eba2e5cc3e515bdad89faa8c5a4b3355fe9b676112fef71b3f3f"

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
