class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.7.0/termchat-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "18c8a632cb35b066b43deb2d757e4b14d0819fe409f113a08e261296653b92c4"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.7.0/termchat-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "a4cdf83ad84f1957d4dfe73a15e3322ca1e428ff51d670ba58f43bbea58c8d2e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.7.0/termchat-v0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ecaabbd203316cfe5b2e2a2959eae7d51903a2f107eb45227bdfcf3b3070d3b1"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.7.0/termchat-v0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "25f9e9490b46e627601fc3f1783bef0cffa781377f8e69e3076bda4ca0edcc4f"
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
