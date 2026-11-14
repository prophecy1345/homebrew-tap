class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.1/termchat-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "b9157ba5b0eee216ea8b981262ce1b7075e656d702b48e6a244a507882cb682f"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.1/termchat-v0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "cfe44a0e477bfeb4067e9699b352992fd2f983f0d5467e9f729ff60fa936f79f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.1/termchat-v0.6.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "09c757768909cca22142d6cd1025200bf623f08103d1ef40608faf5631cee070"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.1/termchat-v0.6.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6185a2a0e3dbfe8140b197d097b0c3af18163e009307cea1783e39e86f1e3cce"
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
