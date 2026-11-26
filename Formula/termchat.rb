class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.2/termchat-v0.37.2-aarch64-apple-darwin.tar.gz"
      sha256 "49bab951e421013123cf838faca655a5f761527666e7b6e8750795a460c1941e"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.2/termchat-v0.37.2-x86_64-apple-darwin.tar.gz"
      sha256 "8be32c759832e737e7f8b83d259afbc9acc7947498e3fca4d36a879b1a5b68dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.2/termchat-v0.37.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9b82883e8ea860875e3db7f7e456995b640c16d561fb483216888f099c43dc46"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.2/termchat-v0.37.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2ba982876b89384f3a7c86407b89fae484892d7376b2a5b51b98389e275df6d4"
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
