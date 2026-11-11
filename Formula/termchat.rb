class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.5/termchat-v0.5.5-aarch64-apple-darwin.tar.gz"
      sha256 "53e561a1b4c7f6ae5de2bec6e1f65d6b6efb320ff9dae9ea703a9a06ced5a542"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.5/termchat-v0.5.5-x86_64-apple-darwin.tar.gz"
      sha256 "8925dd60600a5343ee3e8832ac03695132c7d5917c9a22bee179566c55bb1632"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.5/termchat-v0.5.5-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6f953dd70b5a10b4b3832217906f0c422d8c3d2b1e9a19074c969752f854209d"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.5/termchat-v0.5.5-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5b07c277f9b7e8709199751f06ce9be33775d65c00d7a1afc846c0d70d079879"
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
