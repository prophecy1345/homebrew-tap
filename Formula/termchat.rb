class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.8/termchat-v0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "9a04c6db9c497ea48d36c0e982bbd047705c8742770226e10f6ebb46e7589fe2"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.8/termchat-v0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "6e1579885d33f56bd3338831fd396441812d8a63f592e2c210f727ec182699ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.8/termchat-v0.1.8-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a07b5ce358377a8becb772a4cf971126f005b3a67a44067689d7f45932c2ed06"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.8/termchat-v0.1.8-x86_64-unknown-linux-musl.tar.gz"
      sha256 "acf593360869b50a8e7d3069b7e18956d03579683a6e6f3cbefc64f5f1d5570d"
    end
  end

  def install
    bin.install "termchat"
  end

  test do
    assert_match "termchat #{version}", shell_output("#{bin}/termchat --version")
  end
end
