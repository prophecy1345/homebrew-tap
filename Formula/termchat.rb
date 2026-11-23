class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.26.0/termchat-v0.26.0-aarch64-apple-darwin.tar.gz"
      sha256 "7ca00869531e175355eaad95b53793ba064e34dd3c7cc393a470776719707b22"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.26.0/termchat-v0.26.0-x86_64-apple-darwin.tar.gz"
      sha256 "7821116c5c2a97b6c5dcca65ceb71331ee2f6d0cac8ef1f88f681ceb1d947caf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.26.0/termchat-v0.26.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6718960e090d0b58356d236ba4493163b1979ce7c5bb4f92c1687391d7d54dbc"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.26.0/termchat-v0.26.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e8a6d2bdf696fb20f5d2f7b0bf17f63a977930c96666c06660d43b9f08bf95f0"
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
