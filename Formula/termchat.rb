class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.16.1/termchat-v0.16.1-aarch64-apple-darwin.tar.gz"
      sha256 "8f2b5df598fef2ad3b3f07305e79cc5454eaa7585e14b97bb053002a8cc1bcbb"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.16.1/termchat-v0.16.1-x86_64-apple-darwin.tar.gz"
      sha256 "e063cac516d45c7ce6350ad3b2cd93484543d5b00728839b75edef73b81c818c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.16.1/termchat-v0.16.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "21601d2aa318b86666f8b167009f4027ef1b99e500e40f528a9d933b01509e5f"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.16.1/termchat-v0.16.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ffcc7ccfdefcfdcbf158bda7fef981ebec313dae7005522d08345180a3e488ef"
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
