class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.14.0/termchat-v0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "c7e6b3f8f8dd679e8a5421a1b4adff8eb596cb5373bc523e6a5da10a365685f8"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.14.0/termchat-v0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "c62a2fc0a2e04e3fb138f524c00ec3e9ed4053454afe34284693c67bc183465e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.14.0/termchat-v0.14.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0c9703914de98be2814b37308ea1d705f7316ab0cc8bd9620236c651c7fd3003"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.14.0/termchat-v0.14.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b1845d4913fccf25a6e8935b240a73f1ea6078a2a40a8fa7cb183f2cc5129716"
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
