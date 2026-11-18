class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.11.0/termchat-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "251ab3e4528609f70cb3b06d912b382c0172e1a34bdf816f0a843c1e6da998b0"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.11.0/termchat-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "5938ed52d76f2c36a43d1a15c21ad91032ccfb32e745075e01d78571847b380d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.11.0/termchat-v0.11.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d5145f9ad5924a0391cf61db2bf30cd1e17ff733340e7e26cd7feaa62b308aa9"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.11.0/termchat-v0.11.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "86bfb11151596f68ce5c7c9fa9f70b0c543f30c94d52122a74e677964e82ddd3"
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
