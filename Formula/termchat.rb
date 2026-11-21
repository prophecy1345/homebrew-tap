class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.21.0/termchat-v0.21.0-aarch64-apple-darwin.tar.gz"
      sha256 "02162ae5ee846c76a288008742e4772c1ce68c1320e300754a86aab35c5cb63d"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.21.0/termchat-v0.21.0-x86_64-apple-darwin.tar.gz"
      sha256 "380a82f36c4e57277c96dacfef35d34e5725fe9f60c2bf06116d4f5251ca328c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.21.0/termchat-v0.21.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "90dd3e4623af3aacbc879c3d1acb1d3b4aa0de07610f89179604189e1bc6876c"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.21.0/termchat-v0.21.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "97b8e88da6286ede30be636541bc1309fb30bda44bfc9e2b795896ac57d22abf"
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
