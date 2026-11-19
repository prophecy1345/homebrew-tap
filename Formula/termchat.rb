class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.18.0/termchat-v0.18.0-aarch64-apple-darwin.tar.gz"
      sha256 "bcba1bb27b628180878c9cbe8fe3d7fb26447f1727447369b14e887f8c51cb80"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.18.0/termchat-v0.18.0-x86_64-apple-darwin.tar.gz"
      sha256 "c5fb9bbe81b5f8e7f1d8a0dd61bc566b91df65553f74de98c684b1b16952f5a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.18.0/termchat-v0.18.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "329cc5b2c383e8e459257cd026b35f9d75cf6d4d5f5f1fc460349abdf017a43e"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.18.0/termchat-v0.18.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9fbbebc5b304f266cdfdee2dd82257461e67b6df2d2baaffa693a2de9e0625af"
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
