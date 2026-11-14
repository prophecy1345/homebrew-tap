class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.3/termchat-v0.6.3-aarch64-apple-darwin.tar.gz"
      sha256 "0a705650a3d8c77ad013807ac5b70b443bc49f2c0353a4d8737409a4ae94da24"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.3/termchat-v0.6.3-x86_64-apple-darwin.tar.gz"
      sha256 "d95a81ebc96ca5f70d8be5cb2b8ad6f6ad63b2227b2762b2ec759e797c684687"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.3/termchat-v0.6.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "50cc360b4eb5021ada2c1cf7a6716c8d5c07875d603d2697dcb16c0114e87a93"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.3/termchat-v0.6.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b305721ded975848ed2e473b801da3e2a66fa35b8721b8abbfbb8c2752252783"
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
