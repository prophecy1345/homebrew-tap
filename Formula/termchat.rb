class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.10.0/termchat-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "a114493d5753f5f1a324c7775fd7452dc53ef695a21365dce6b61aa7def9d67b"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.10.0/termchat-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "78a2fad6d0107efc4b70eb001869e4f55e11c001853ec3746a7c04571bbebfc0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.10.0/termchat-v0.10.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e5e3193c6bef1a09990bf2da3d5e9d5a946f7ea55f88ccf3b2a72592df6e2b37"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.10.0/termchat-v0.10.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fa97080400f8d2e3ca47a486ef3cd5728d05ee610b49ddf35ee9d7d7224c9ec4"
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
