class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.0/termchat-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "8790e507513e52201157440a5964ec9f3bc88c2f970171c952f347781dddf15f"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.0/termchat-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "d69cadc0e2560d29a028f28771ed60b0fcecf6e740401250b7d3a2642fb796b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.0/termchat-v0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1f73c699338a44a8f4941aa8cd5cdd5149a1ca75803e9a7cde1b20add8875623"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.0/termchat-v0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4dae728248de6517338884b3444b1377a9c0366e3805c885f7b9dc7d1dc768ef"
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
