class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.13.0/termchat-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "b93f98d976f793d8f976b373fa423018f3dfc571cec10277d22a470463717dfc"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.13.0/termchat-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "dc3b8ae0319376c4ec4d42cb14f4fd75228e08873af37dcb3c5b8707f3997992"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.13.0/termchat-v0.13.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "929a04814e5d2076d39180c15e5693750b4a0c2798860e5025de718b24d51ada"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.13.0/termchat-v0.13.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ad47fd73c8002a268c1d33d65432605f11f15ffceeeb229b804671380ab738ce"
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
