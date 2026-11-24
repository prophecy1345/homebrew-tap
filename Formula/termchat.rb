class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.2/termchat-v0.33.2-aarch64-apple-darwin.tar.gz"
      sha256 "be70116823506e9fb687152f9588b87873bb8a94538a34a3ac478827dd605574"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.2/termchat-v0.33.2-x86_64-apple-darwin.tar.gz"
      sha256 "cae3daeb46ca982ea1633d49d0c423df201780a67def553f2e47cd2d730fed83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.2/termchat-v0.33.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b2e3598dbce829525bed4bda0c6d7f09a89a7c041f7ea717a1b8f7f18ac26f78"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.2/termchat-v0.33.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "336e911d2f9da4f6ef520c11b5c80715e4d2aab5dfe1ea117b3779264d6f0833"
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
