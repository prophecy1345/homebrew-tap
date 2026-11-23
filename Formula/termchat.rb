class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.28.1/termchat-v0.28.1-aarch64-apple-darwin.tar.gz"
      sha256 "2290a37c7375369075c3844d93f3cb0631987f2775efc8e286feaf29bd6488f5"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.28.1/termchat-v0.28.1-x86_64-apple-darwin.tar.gz"
      sha256 "9c2fa330c3e2b008094870ff56658fbf466426a86ee0051f37bde5c452816114"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.28.1/termchat-v0.28.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4fa4814bbaf905faf11462bb3bd10d494c055401855f35445a8798e127bcc406"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.28.1/termchat-v0.28.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c299d0ec2860f49cccc01aefe33f5555d1c87d21b39568ac8326707cfad970ea"
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
