class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.30.0/termchat-v0.30.0-aarch64-apple-darwin.tar.gz"
      sha256 "07a196c9a2aaabbc02323f77aa164032d709a49bf97597fa44416fdb42ab4d37"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.30.0/termchat-v0.30.0-x86_64-apple-darwin.tar.gz"
      sha256 "65abbc0892cc336c4efddbcf027b2e93c7adbf0fa48acb214bde7a11a0168fbf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.30.0/termchat-v0.30.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6c30f1147e558fdaed98a28b8397687b2221493fd1cd571d488a234424bda92a"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.30.0/termchat-v0.30.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "734e7eaebedcbcc8b662be4322943bc956eb1460978b51657aa4f1db9d3fb0e8"
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
