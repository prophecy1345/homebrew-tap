class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.14/termchat-v0.1.14-aarch64-apple-darwin.tar.gz"
      sha256 "1aa5a8957c8a9ade14824427b9f6033ffbddd8ac5c421b39350c9577e0b3272b"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.14/termchat-v0.1.14-x86_64-apple-darwin.tar.gz"
      sha256 "20bfe3ebec2b9998b9206e45f121dcdc68d38d65ef779e1a7ced2dea8be57612"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.14/termchat-v0.1.14-aarch64-unknown-linux-musl.tar.gz"
      sha256 "933816204e9d8b28d704e8d70a377808d1f7b944014e58d283e83652cde443b2"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.14/termchat-v0.1.14-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f9d4d69a31a9ce6165eb4c22d3685855dd40d591a32521dc00fadea9cfa3d4cb"
    end
  end

  def install
    bin.install "termchat"
  end

  test do
    assert_match "termchat #{version}", shell_output("#{bin}/termchat --version")
  end
end
