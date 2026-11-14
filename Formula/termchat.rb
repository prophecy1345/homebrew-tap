class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.2/termchat-v0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "178a2bc2176f09b22c9fb82774b0599a733402a3e0e463142b3b33ecf891450f"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.2/termchat-v0.6.2-x86_64-apple-darwin.tar.gz"
      sha256 "a483f3e91c8fa1962b86a7d136e1a06dbd258ade3308f204e40b2b5e398c3e4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.2/termchat-v0.6.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2d3fba406ce62bc0d83c052bb06dae39c3743f5aa96babeb408c3f8f87b5826d"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.2/termchat-v0.6.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "06feeffb0daf84643737a4167ab25ce25965ec7dc6ab5d2bc3fe4c4c4bbc0e4a"
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
