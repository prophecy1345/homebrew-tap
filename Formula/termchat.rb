class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.3.0/termchat-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "b006f13d2d5822786933b3d2e69a310ef8de16d4888968e8dd4057bfde04871d"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.3.0/termchat-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "1b1b014bdab9ff2cbc5cda673453bdcaadf176c4b36aa8c2fe474ce0318a249a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.3.0/termchat-v0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "08aa287314f51ca825972e29d8873fde923b5be88beade7759217a1c07f1f2b5"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.3.0/termchat-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c89403111e5ec5c607dc44d6c5a049193ab0ce86888854b850c288fc8bcd3da1"
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
