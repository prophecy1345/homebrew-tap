class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.0/termchat-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "60daf5e4de93103c1f984b15d43d608b92c10899fd2c1f2f7710d28cae10c96c"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.0/termchat-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "6782cfbdfb5fe0ebe862df44cc19e78d34f4f163971c8ff56980f048dd006dee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.0/termchat-v0.9.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7bf50903403b4d099cebcd1a55861dc7bc35b38ecd66e62a3db94dcf661bd6aa"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.0/termchat-v0.9.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "db4b44ea4478f6084fc1ecad49945d5900b30304a409519e5de21e1863fbb52f"
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
