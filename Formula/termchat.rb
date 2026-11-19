class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.3/termchat-v0.15.3-aarch64-apple-darwin.tar.gz"
      sha256 "cd7e476acec2b78c99cf64560ccfd1e7eec252c27f9c48958bf92040a3a9d3f4"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.3/termchat-v0.15.3-x86_64-apple-darwin.tar.gz"
      sha256 "af55371eb357348632d792566ce2e2076957a2d0c3d4aab92892076a9fb5a0cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.3/termchat-v0.15.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6e4c14c4ddbe3f05e82efddeb951507069ffc98e84be94614c00a8d703170b2c"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.3/termchat-v0.15.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7acc83f6863e73afef28605a33b6fc4a0e221b5672f1f7604825cf483dbbe2ce"
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
