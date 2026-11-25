class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.0/termchat-v0.37.0-aarch64-apple-darwin.tar.gz"
      sha256 "1c3caca8f20676d24a84df2fd111fc40eabc21c0f8ebc2711b1ac94d4830c192"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.0/termchat-v0.37.0-x86_64-apple-darwin.tar.gz"
      sha256 "12402c372dc83e1d096be22f99e1655129b8f44c4353d79b1e45272813fd8983"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.0/termchat-v0.37.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "78d4d82492ac3267115c0d04900ec2ffee107acdc4f5fac8d4a9839cf9741659"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.0/termchat-v0.37.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b1f14fa3dfeeed9fd638c4f781df5832b52ade48dac8bed2e31a82b681b09328"
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
