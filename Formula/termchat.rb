class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.1/termchat-v0.20.1-aarch64-apple-darwin.tar.gz"
      sha256 "9fddb88fede70152bd3702c7c284c4d5fc230ec99723affafdae1406018aef55"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.1/termchat-v0.20.1-x86_64-apple-darwin.tar.gz"
      sha256 "4f6f2bcec0e793b8a9dab5abb34caf28629b50160ec9799d4c816350d7295889"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.1/termchat-v0.20.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c6746036d4ed413dc54cb830bcaa279623b0f8a2bf39f20d2b8700119e960561"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.1/termchat-v0.20.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "59769606c4542a262bcbe45984702fa5819fba1df908411cc3f11fb5584a3095"
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
