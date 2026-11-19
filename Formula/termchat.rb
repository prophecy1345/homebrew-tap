class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.0/termchat-v0.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "01d38f0a7a73fc0e04c8f13aa9fd3c39dcf5f7b81cf4ae7fc9c2c02fe68fecd9"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.0/termchat-v0.17.0-x86_64-apple-darwin.tar.gz"
      sha256 "4aaec05c8b6e24b394e0420f8f2b34f4802234357076275cd2c66c2defdff833"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.0/termchat-v0.17.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a69f180790594c7bfc353f8e2b48119bfa4fad52c4ae865778cb96722aa38bbf"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.0/termchat-v0.17.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8c7303996a7c94f8b71b26158a03bb86629581ef58d5f9de07247ed04792e581"
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
