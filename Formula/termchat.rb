class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.34.1/termchat-v0.34.1-aarch64-apple-darwin.tar.gz"
      sha256 "4dc855c3552ed52d52a1dd444f6dec1ce64a2bc8c0733bbb865a6dce0139ccee"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.34.1/termchat-v0.34.1-x86_64-apple-darwin.tar.gz"
      sha256 "7281b83b93d11725c91b672b03077f4471a25072ee96f60229c57ef6c5c7da6e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.34.1/termchat-v0.34.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "41c929bd15ee88b109dacabaf696310674b88bd8b7394e5d9625d408797f4c68"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.34.1/termchat-v0.34.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "015ab0d334a44eb1447c120bab773ecc798182b1c2d252a6aae15cc52230cc9f"
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
