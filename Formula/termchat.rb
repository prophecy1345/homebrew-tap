class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.23.0/termchat-v0.23.0-aarch64-apple-darwin.tar.gz"
      sha256 "2dbc4c31e5d9e98e6573f7bf01227a1a0e38faa4a8f14349c4f6e0b0e0e8a007"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.23.0/termchat-v0.23.0-x86_64-apple-darwin.tar.gz"
      sha256 "6ec69c96a6f8dc2c90337b18d6d51b9e8bea57c85efd673deb457d4ed549997a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.23.0/termchat-v0.23.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9bac40a5bbeaeb71bb3284b8e38c4e943d00eba3bad13d6ac6e5dbb17fecec10"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.23.0/termchat-v0.23.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "31bc3d0a151158d50795abe6640b08ed2aa83505a031abb8255c67726933d632"
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
