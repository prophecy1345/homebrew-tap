class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.39.0/termchat-v0.39.0-aarch64-apple-darwin.tar.gz"
      sha256 "d22032042910fb906014ef53e87dbcb981bc952241c64da6b8d75322737d62e5"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.39.0/termchat-v0.39.0-x86_64-apple-darwin.tar.gz"
      sha256 "50f75888ba53f2eca976bec0a558a48c0ae817de289a95701da3088ec86ca8c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.39.0/termchat-v0.39.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bb8cfb5e00536a49177a125cfda3024babe12e73664973f0b6dfaa27de1a0fe7"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.39.0/termchat-v0.39.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4cde98ae52a9daeb19f5d6c9261c5e4e453c61471a0de40a855bd48773d9a151"
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
