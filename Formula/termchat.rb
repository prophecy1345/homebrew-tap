class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.36.1/termchat-v0.36.1-aarch64-apple-darwin.tar.gz"
      sha256 "673a4a5a0584ceb6daf3f093b1b1cb92b04c6923f0ce48159f0b78bb5f573a94"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.36.1/termchat-v0.36.1-x86_64-apple-darwin.tar.gz"
      sha256 "ebbd5c5a573c27ac95b2a62a5c0c75d1c51655e012fadd0fa11c1494e2e12dc3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.36.1/termchat-v0.36.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "53ef543f96ecd96795e1426f6efd6bf726c33394f959302527d9dd80bf5e47f3"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.36.1/termchat-v0.36.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "54db06ec13dc11153de96bf3b3cf3b6255ecc738f5a09a2329ea74c72c8d17c8"
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
