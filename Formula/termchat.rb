class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.3.2/termchat-v0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "8e0204c72af344fde4b90cc7a3859136d639fcea3aa5b967fcad1115b1cbd6b7"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.3.2/termchat-v0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "d10a66778e587a267467656f40e538cc4400e2583956abe5d7f2f04ff21f4fee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.3.2/termchat-v0.3.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b38061acae1895fa0b4a3c48005a4784bf019eff0565037bb43967cecc3a72ee"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.3.2/termchat-v0.3.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ab1291ff28dc6d8d15c75ed014f50a57148443b56133c526da4d9dff32f4a3f4"
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
