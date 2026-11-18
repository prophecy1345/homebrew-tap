class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.1/termchat-v0.15.1-aarch64-apple-darwin.tar.gz"
      sha256 "8974939a8adf3ac7df2512805afa42d802d6f41d97fd8e2d32ed0d8261667632"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.1/termchat-v0.15.1-x86_64-apple-darwin.tar.gz"
      sha256 "85ecd798656eb7deb2acc167bcabedd52a1edbdf09eb1b90fb26742cfc843786"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.1/termchat-v0.15.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "699950a04a2d45d15bac0cbf4b594b3752326888a161020147ce9e31c2368df7"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.1/termchat-v0.15.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "52d0f0759f4e10f63af95289e2ac6913f1ecad62ded3691bbe939f415a74d627"
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
