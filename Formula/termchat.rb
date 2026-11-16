class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.1/termchat-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "60c644514f6547344891f1f910789667bd74d6ab6467fd1b570aa672a517c734"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.1/termchat-v0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "8290c3bd553a5c08c4b904a8cfd6601e888a28cf14251b516cd4c211216cde74"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.1/termchat-v0.8.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "05fa62ad514750f9b09b9ad6e1b07bdc4e232f0d654e5686041d36b2fb033875"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.1/termchat-v0.8.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bdadde55c5fed751aaf482a6afae290689cbd36602175258fca16ef719046baa"
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
