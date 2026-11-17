class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.1/termchat-v0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "eb09e4893fafa05d9afed2991c8b2cded75ef3d7b6697390ae82d540a2ed9100"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.1/termchat-v0.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "2e271dac8c06d17e151b689dc89b4192a24f89231aa9751bb4d88ff334bdc4cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.1/termchat-v0.9.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5e4b2fdc0adefbe356bc99a1ee58f1ee73535994af500549f1887af8980cda0d"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.1/termchat-v0.9.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3eaa1a0a38d7308078de783bca9b67675f037f9d4997f3432918fa52e59fec7b"
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
