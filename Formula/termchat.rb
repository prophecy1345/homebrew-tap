class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.4.0/termchat-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "8bca2d9e4310d4bbdc803027a38b8c807adeb39d7db172ed9215faa89c1bceca"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.4.0/termchat-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "fdf6d3cd6696b51da870767de2d8fe1a1b30ecbd61b00f85d8ba9bf499ec392b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.4.0/termchat-v0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2244273cdab254c4a816a0ee0314a5ce3c7334b104129266759a119f43177662"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.4.0/termchat-v0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e07ffbac7040b5e72413caa65c75138a80d6763f55d098775b96562364f63d0c"
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
