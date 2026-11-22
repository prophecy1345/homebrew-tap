class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.24.0/termchat-v0.24.0-aarch64-apple-darwin.tar.gz"
      sha256 "fb749a8b8c5de865955d399a76be84c8de8b5c50fa4bcdb13f57f1eed2dd6044"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.24.0/termchat-v0.24.0-x86_64-apple-darwin.tar.gz"
      sha256 "d8380c365905ecbc72d68420976a148b3e581d39c9f702e2275ff11f33042669"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.24.0/termchat-v0.24.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "339174d30ec551085bd9196061958734b2f8c28dc4e974f952e7bf6e8eb18fb3"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.24.0/termchat-v0.24.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "92fa888cc14d81cf3986c263e6f93742abfd5df87500bd12c942f987d74ac22c"
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
