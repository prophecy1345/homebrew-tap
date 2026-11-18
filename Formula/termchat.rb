class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.12.0/termchat-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "31343b36304c9d0a64b92081268dbba2c685d3782f9e76d0382b3bdeab9c32a5"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.12.0/termchat-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "a00e1f568a52970a75cea141c8e564a1fc91e7b5db56c832ffa8a9b92fa62ae4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.12.0/termchat-v0.12.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c79f9e955d22fec0858d132ab76fc0e652a76e133c2f527cd080d51a63e2d3ca"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.12.0/termchat-v0.12.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5528425e8464ea46d75b789db34475bbd6b0cfebdc5fe476776dc186f5a2d27b"
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
