class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.34.0/termchat-v0.34.0-aarch64-apple-darwin.tar.gz"
      sha256 "ab5d9ced859384477ac543327c363a5a2ef947bcd75bddacee949539d5c1cc7f"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.34.0/termchat-v0.34.0-x86_64-apple-darwin.tar.gz"
      sha256 "1e8aeec202d4c283fea49055c68463b8644c185902d707b3f34ec3a64eb46d69"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.34.0/termchat-v0.34.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f3c3ac379583491c12e33b1bec85a64cb1d334b62cd683aa9d88d2ec8e9de450"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.34.0/termchat-v0.34.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "98284674703f16e9e29ccfa911452fb6aafc8ddff297235eaebe2a20aa4ceadf"
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
