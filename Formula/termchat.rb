class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.2/termchat-v0.15.2-aarch64-apple-darwin.tar.gz"
      sha256 "6b1514dfdc559e84ef31ff75b135c0e892e6c6cc4d9f997195d4738e8a87d9a7"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.2/termchat-v0.15.2-x86_64-apple-darwin.tar.gz"
      sha256 "59eb929c8e8f74bf9226ea47c4a6fc3e8b78bf4a7b61d3b826571adcc3fdebfd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.2/termchat-v0.15.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d6c34c593795e0b7abbc8826ee4b3953fc5c4711575cde80190082849a30b389"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.2/termchat-v0.15.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9083b734b7a7fb3b6b09628052e9e5d1e59824d5f7a8997b41c9a21ff93a3e84"
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
