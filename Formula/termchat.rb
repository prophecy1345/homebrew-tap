class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.0/termchat-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "3878ceae0fc59b507c4338f97bb2fc7e1d44958bf99a9d493c29c7b3fec8a314"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.0/termchat-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "432c4f22a6a4c4814d00a16e308e352df4162c9904e4380ba47f9198e5fff34a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.0/termchat-v0.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5254f824142a0164b445c698f57916f6d9e471b4cfea75e9e6762d64a8056ef3"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.0/termchat-v0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6ae9fc89b4001f5605bbf52bb062e505fcaf5578b343a6617f1143fcf7e7162d"
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
