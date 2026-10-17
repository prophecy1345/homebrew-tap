class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.13/termchat-v0.1.13-aarch64-apple-darwin.tar.gz"
      sha256 "15985bdcf7a39de621971f26efa234b7781b9d80aeae56f85e669f9ae119a0ea"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.13/termchat-v0.1.13-x86_64-apple-darwin.tar.gz"
      sha256 "3ab2634fad0c39d1fa741d0ba2e9a8e6a37b90768480c9302ac2fffe5e851c85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.13/termchat-v0.1.13-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f2ded42c4efb3c1c63854daff8147d446231c4dac54f61b2fcdc3810e6d81e49"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.13/termchat-v0.1.13-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dfef9674f067a6dd443875ab35dda52e0d9758d7ee78ecf2a45f41be5427e138"
    end
  end

  def install
    bin.install "termchat"
  end

  test do
    assert_match "termchat #{version}", shell_output("#{bin}/termchat --version")
  end
end
