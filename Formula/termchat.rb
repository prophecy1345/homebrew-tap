class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.2/termchat-v0.17.2-aarch64-apple-darwin.tar.gz"
      sha256 "e3a7f13de953bd715e0f04ba539567475a8831023de54c70babc6453ec4ebf19"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.2/termchat-v0.17.2-x86_64-apple-darwin.tar.gz"
      sha256 "33bdea4723bcdcde1c6dbe6bde38e31da8d22e7fbde9333a1928100446bd98f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.2/termchat-v0.17.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "54d88c572e9b571ffc01ca6eafff668564a1d6ebe651aeb2845eb94d63982d90"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.2/termchat-v0.17.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "31c0a7ac382d18cafe84e79b81916e669aefb76705691683f59a830e6728f771"
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
