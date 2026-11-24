class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.29.0/termchat-v0.29.0-aarch64-apple-darwin.tar.gz"
      sha256 "462e1b450483cc803526a5cff8782e4032af638dd4ef9924ad7440459c5d1934"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.29.0/termchat-v0.29.0-x86_64-apple-darwin.tar.gz"
      sha256 "d5e8d9912369de5fc7dd6f2735324a6154ea42c37e8bfce8aae899aff6a1ab7d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.29.0/termchat-v0.29.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f77f141725006b853225feb68180cd97e0389e57b298b671aea1712bf2ae34ab"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.29.0/termchat-v0.29.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6563d84ebbfaa23c6ae83663aadaa658952774a5fe4f41e29c904f83153959e7"
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
