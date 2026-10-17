class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.11/termchat-v0.1.11-aarch64-apple-darwin.tar.gz"
      sha256 "294194e22559910f337b84e7bc4300c75fdd7a491f74f1fffb99931801a4d3a4"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.11/termchat-v0.1.11-x86_64-apple-darwin.tar.gz"
      sha256 "095eafca5af4245afdbece24d724f51c18e22498aea9b32b5ce4c626bce8eeea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.11/termchat-v0.1.11-aarch64-unknown-linux-musl.tar.gz"
      sha256 "27a68b1ff09be5feec40b496924fa99736a6d560cc321bde33603ec64b4ca2d9"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.11/termchat-v0.1.11-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f3178082a106c99153b1b92e50b308cc30ca200f66f173a01aefc772b322f104"
    end
  end

  def install
    bin.install "termchat"
  end

  test do
    assert_match "termchat #{version}", shell_output("#{bin}/termchat --version")
  end
end
