class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.3.3/termchat-v0.3.3-aarch64-apple-darwin.tar.gz"
      sha256 "40bd985876bfce53334d4f273a7bb77d10c2dfd0817ccba77fb8bf4b0ff05eaa"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.3.3/termchat-v0.3.3-x86_64-apple-darwin.tar.gz"
      sha256 "b42f92e0189091109db100689d38d6d5cfbc357576da46e328a781a46439b97c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.3.3/termchat-v0.3.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2d6e1ec489acb11402c6274411fccdd8ffdca49a3df2b6b20ac06640d1a5088d"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.3.3/termchat-v0.3.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4c800c8594a6985b43bc329afcdad8daa3e5fe9368ff89cbc50fd3e59d9835af"
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
