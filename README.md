# Moonlight - iOS Monitor Support 🖥️

A fork of [Moonlight iOS](https://github.com/moonlight-stream/moonlight-ios)
focused on external monitor support and power user features.

## ✨ New Features

- 🖥️ **External monitor fullscreen output** — dedicated fullscreen video
  output to your monitor with a waiting screen before stream starts
- 🖱️ **Mouse cursor hidden** when streaming to external display
- 📱 **Touchpad Mode** — iPhone screen goes black when monitor is
  connected, use your iPhone as a trackpad
- 🔄 **Reverse scroll direction** toggle in settings
- 🎯 **Disable mouse smoothing** toggle in settings
- ⚡ **Lower latency optimizations** for snappier streaming
- 🌐 **Tailscale optimized** — better packet sizing for remote streaming

## 📲 How to Install

1. Download the latest `MoonlightPlus.ipa` from
   [Releases](../../releases/latest)
2. Install [AltStore](https://altstore.io) on your iPhone
3. Sideload the `.ipa` via AltStore
4. AltStore will auto re-sign every 7 days over WiFi

## ⚠️ Requirements

- iPhone with iOS 14+
- AltStore Classic (free, worldwide) from [altstore.io](https://altstore.io)
- A PC running [Sunshine](https://github.com/LizardByte/Sunshine)
  or GeForce Experience

## 🔧 How to Build Yourself

1. Fork this repo on GitHub
2. GitHub Actions automatically builds on every push using a real Mac
3. Download `.ipa` from Actions artifacts or Releases tab

## 💡 Tips

- Use **Tailscale** for low latency streaming when abroad
- Use **H.264** codec for fastest decode on iPhone
- Enable **Touchpad Mode** in settings when connected to a monitor

## 📖 Based On

This app is based on
[Moonlight iOS](https://github.com/moonlight-stream/moonlight-ios)
by the Moonlight Stream team. All original Moonlight features are preserved.

## 📜 License

GPL v3 — same license as the original Moonlight project.
