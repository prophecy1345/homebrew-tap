class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.2/termchat-v0.20.2-aarch64-apple-darwin.tar.gz"
      sha256 "c162540429f459fbbe593e6ebb0a235413f13f4ad0e2833d24db39194333d85d"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.2/termchat-v0.20.2-x86_64-apple-darwin.tar.gz"
      sha256 "c919f39e7c7050ccbdd0593c128521e455904b87203e1aeb546534f7ceabe9ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.2/termchat-v0.20.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b1d624bfa68651d96e259ace1a70995ea03f562c4bcbbe3bee969130cbd5a351"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.2/termchat-v0.20.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "be414bcaf3e68d244d5ef2376f43a5c89cab02e6f170ff88365493e600d5f84d"
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
