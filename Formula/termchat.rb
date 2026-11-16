class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.2/termchat-v0.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "aef45821207e763cf9ca7ab7097817a6713fd701cd7ec0acd4fa761377a03795"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.2/termchat-v0.8.2-x86_64-apple-darwin.tar.gz"
      sha256 "add6c35b96d6e891683175c7ef2f2be38e613fe280df5a78c3b9ef2838afa24b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.2/termchat-v0.8.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5153881a022223bf681735b4b0e37a7b3e1111cb9f3a3b2e2a76df540ba1b276"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.2/termchat-v0.8.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "92b71c69480181940d1bf179df3747c34101ce70ddca037267ae15702347a043"
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
