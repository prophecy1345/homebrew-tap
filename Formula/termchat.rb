class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.32.0/termchat-v0.32.0-aarch64-apple-darwin.tar.gz"
      sha256 "ff4f2a05b48a80f92add68b1c7fcb7d6ec99d89c5b52ca32dcacdd7f57b924ad"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.32.0/termchat-v0.32.0-x86_64-apple-darwin.tar.gz"
      sha256 "012649966bb5093ec7c14227526b3a96499b85fd5fa7601319f7c16e0135ac23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.32.0/termchat-v0.32.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9e1369486f44458d2b1693db3f832de87beea7c9cd278ab5a5c949f54232ff83"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.32.0/termchat-v0.32.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3888d4786e30dc12f16e96866379d55da78a8bdc2b5cec9b24c2cf82d8d19833"
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
