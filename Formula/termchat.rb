class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.7/termchat-v0.5.7-aarch64-apple-darwin.tar.gz"
      sha256 "8cd27ea21b94c22d5c9b14ef6a6cc4b19085457afc6885e33369cabafe7f0d0e"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.7/termchat-v0.5.7-x86_64-apple-darwin.tar.gz"
      sha256 "f533374f124a680b38b967c9be64cc7a11240d1967d5f7e882abe0b3be5bea11"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.7/termchat-v0.5.7-aarch64-unknown-linux-musl.tar.gz"
      sha256 "16b9dc554e4071ab1c4da99f9237dc243069e71f322314067a089c695255bc24"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.7/termchat-v0.5.7-x86_64-unknown-linux-musl.tar.gz"
      sha256 "981a605f107fec69bf95bf59966133cb9cfdbc805ad567d0b2dfc630cb773c73"
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
