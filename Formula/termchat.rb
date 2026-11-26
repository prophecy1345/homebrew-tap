class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.1/termchat-v0.37.1-aarch64-apple-darwin.tar.gz"
      sha256 "b72b93ef9bc72e637779530b57b9c5091bd9e706fdd1a89e04e138f8f9e46d0c"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.1/termchat-v0.37.1-x86_64-apple-darwin.tar.gz"
      sha256 "f9e47faa2c9f40b72c0eaafa4b4c0630395b5d1090d9b7abff70c66f5c46cab3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.1/termchat-v0.37.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3d7906e36118c646dd4fb78d46d6fd0473e99bea8a2d7217a845d1e60fc8c930"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.1/termchat-v0.37.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a733cfab4807be3976fc7aca3f4cc2ef26cdb68a28f2b7b31e0ae1aa5d886d44"
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
