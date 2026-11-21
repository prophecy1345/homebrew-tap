class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.22.0/termchat-v0.22.0-aarch64-apple-darwin.tar.gz"
      sha256 "2c3229450f4065109756cfc545a73df135319eb285618c2bd71da2a00b41612a"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.22.0/termchat-v0.22.0-x86_64-apple-darwin.tar.gz"
      sha256 "8dd17dacc8644a3ace21f9788b38d8eeb5e23d8be5ce3b01b5fdd138233b1421"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.22.0/termchat-v0.22.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "06b42c4ed083852e742a9850994d2ba06d0767dd0492a8f3d1b4e888040d3b58"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.22.0/termchat-v0.22.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4fe86cf63a2b8e364db01307eb957cd41e1f1689e9e62820c66c186fd2f1a75f"
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
