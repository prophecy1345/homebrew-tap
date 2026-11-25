class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.36.0/termchat-v0.36.0-aarch64-apple-darwin.tar.gz"
      sha256 "162766d40ff7278bb59c0da4d4b6fed9316df081c7e34e66a30b1da2b3afcdcb"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.36.0/termchat-v0.36.0-x86_64-apple-darwin.tar.gz"
      sha256 "7c77a8179e08c82bab4e4860442fb239cfca3cf1c9a63dcb1de06c6bb3a5059d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.36.0/termchat-v0.36.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d4f69dbb3f0fef5b0be1a1dabd4a1de7dc8d3fcbc78a1521c94570387d141461"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.36.0/termchat-v0.36.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8c5eee47ac95638cafe5371859560a5647e1218ad67b3a2ee9acaf9b652d9b9a"
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
