class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.25.0/termchat-v0.25.0-aarch64-apple-darwin.tar.gz"
      sha256 "64500736ffe2b8ad205ec1a1f5f530e90627cf45c33ebfc95281871671ff0098"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.25.0/termchat-v0.25.0-x86_64-apple-darwin.tar.gz"
      sha256 "c524c72dcf5ba2be88f6f927a2b3f940adf3f7ffe9d4211bd109ee1bb075c9e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.25.0/termchat-v0.25.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "91b033dc0fbff1ec3b2d1e2ef9657a301900a9cc31a83c651ca7e1020d3ddcd9"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.25.0/termchat-v0.25.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "def22800db0a5f1713cc0aaba39e40871712f10a09adceea73cbe3194532007a"
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
