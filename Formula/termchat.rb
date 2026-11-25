class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.35.0/termchat-v0.35.0-aarch64-apple-darwin.tar.gz"
      sha256 "025abf9bbd1ccd0973a099b1c392efe57d3dac5077a25d0f3391e20568ebe5b4"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.35.0/termchat-v0.35.0-x86_64-apple-darwin.tar.gz"
      sha256 "842b8a8b8c8f8d1d70a8f3cf34cd955698e909c9a6296100dd9d10ea444ebb59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.35.0/termchat-v0.35.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "829af48368cca4bc7900029f91a0227a8d9d416b506c8bc1577e42fdd9a34f51"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.35.0/termchat-v0.35.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "74d52e6fb02605c0f25f49b31c0c286f21ecf3efff38f378c081d2c4e2c3ccab"
    end
  end

  def install
    # lyrebird, for Tor bridges (ADR-015): termchat looks for it next to itself.
    bin.install "termchat", "lyrebird"
  end

  test do
    assert_match "termchat #{version}", shell_output("#{bin}/termchat --version")
  end
end
