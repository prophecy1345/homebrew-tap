class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.12/termchat-v0.1.12-aarch64-apple-darwin.tar.gz"
      sha256 "8252706c9638b91f2a76ffdd794d3d4efff61596885639e3c73882279acf7d68"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.12/termchat-v0.1.12-x86_64-apple-darwin.tar.gz"
      sha256 "418b340229a85309c33087fe73d698df81e154799796eeb670481a4448c087b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.12/termchat-v0.1.12-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ec14d552a78209a928ea0c3f6838833f9fa13a3e963572cd3dd6f5e97e10724a"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.12/termchat-v0.1.12-x86_64-unknown-linux-musl.tar.gz"
      sha256 "38ca92f3cfc64f9ea6fb8653eb047cd2664bbe7dfff36a4701a7c9fade19ef54"
    end
  end

  def install
    bin.install "termchat"
  end

  test do
    assert_match "termchat #{version}", shell_output("#{bin}/termchat --version")
  end
end
