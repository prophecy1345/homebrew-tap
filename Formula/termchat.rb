class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.5/termchat-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "66eb7a5112018077c1a0e6c350e3239df5c76c86edd0d0cef79248b32dc145eb"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.5/termchat-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "0047dd7341dd9316ecc55d57b9c2d94cc83ccd1b9c13bf8da77e487dc6f04107"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.5/termchat-v0.1.5-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c11c7072cc56c3847715462fba2abb9cb7f591c81246ef0c199ba27b915554c6"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.5/termchat-v0.1.5-x86_64-unknown-linux-musl.tar.gz"
      sha256 "05a2de10abc931387c684abc0fd58814102746feaf51594c3eaf9a9eee7115c6"
    end
  end

  def install
    bin.install "termchat"
  end

  test do
    assert_match "termchat #{version}", shell_output("#{bin}/termchat --version")
  end
end
