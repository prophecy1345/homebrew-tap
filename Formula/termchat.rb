class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.11.1/termchat-v0.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "d2be7c212d12ba1b451f97176b9b87b9fb9dda420bac6770758bba46bc168698"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.11.1/termchat-v0.11.1-x86_64-apple-darwin.tar.gz"
      sha256 "70bedc6ec9b7c84623bc36709e3334841d0eaa6e5913d09603f5c7cc317dd27e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.11.1/termchat-v0.11.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0f500d1a44d1cc089ae2936346c0a532ad4a3b6ebbb639c40e60ba6b079d5a6c"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.11.1/termchat-v0.11.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "421383418603366b936e3f20b167a51ed18d786b6e5943e3893fec2a4d602b1b"
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
