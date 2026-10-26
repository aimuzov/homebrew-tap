# homebrew-tap

Homebrew casks of my apps.

```sh
brew install --cask aimuzov/tap/kumiko
```

## kumiko

[kumiko](https://github.com/aimuzov/kumiko) is a tiling window manager for macOS with workspaces,
hotkeys and a status bar, all in one app. The cask installs `Kumiko.app` into Applications and puts
its `kumiko` command on the `PATH`.

The app is not notarized yet, so the cask takes the quarantine flag off `Kumiko.app` after
installing it: without that macOS refuses to open it the first time. `brew uninstall --zap kumiko`
also removes its config and state.

## License

MIT
