class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.3/termchat-v0.17.3-aarch64-apple-darwin.tar.gz"
      sha256 "263b4d89e757b1079ae956a2affe00a0399740419db2575864834b12104db2b5"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.3/termchat-v0.17.3-x86_64-apple-darwin.tar.gz"
      sha256 "537e2fb87c7adac08ec6f7a78fed42cf2f35054a0359bc42c75276369048e7ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.3/termchat-v0.17.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2cba2e335b510386dbf9e6c81ce8181f690ab230313d4bb01fe62d873228fab8"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.3/termchat-v0.17.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d27a2edfcc4f11bcb2bdb83f12ae46d002866926db8dda7f221aacc4749758d0"
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
