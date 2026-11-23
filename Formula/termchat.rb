class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.28.0/termchat-v0.28.0-aarch64-apple-darwin.tar.gz"
      sha256 "6bf5fd6a3ea9551bc1e3b044805aaa9e960ae435c50bf3e38f0e61859ffac69b"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.28.0/termchat-v0.28.0-x86_64-apple-darwin.tar.gz"
      sha256 "0a2d17598c0b66cdc6896f851c72d867241daa5f072c435dc34bbc18c18b0101"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.28.0/termchat-v0.28.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f3101f3fde5c3e4f3395be3aa203cf1415bd431a7dd2df48c457ef5e429171d0"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.28.0/termchat-v0.28.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9638180c197a3043a8222b33b227769a09039e0e2073b1ce36ba10e9757de9a9"
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
