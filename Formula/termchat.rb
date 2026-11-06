class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.0/termchat-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "0c301259404b9f341390cec5282fe820e33f67931f1c1bc4921a429f23bca357"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.0/termchat-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "67f907fee7987f7c1e74c459f2c679c31d9226e435357980bd10e7e15e6dd167"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.0/termchat-v0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6e27330d65fe2c1d383baead124d6f3be33e26f3ae5a4436acdcd1189f1a9e15"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.0/termchat-v0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a0c1921cfb5974fbd38527ece212dee517809dc8887414179751467acc16da34"
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
