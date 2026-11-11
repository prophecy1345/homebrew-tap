class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.4/termchat-v0.5.4-aarch64-apple-darwin.tar.gz"
      sha256 "57d0f25d80029e852912d2f3dea3452c898451bc40d0735c8de9b5d38367499d"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.4/termchat-v0.5.4-x86_64-apple-darwin.tar.gz"
      sha256 "adc6a73553921f7ad85b8303e428864d0e9ddbb0c609f57ea21908523e2a9742"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.4/termchat-v0.5.4-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d512b9afe56edffdea5d310077c2412d0e7502cd5c65fcbe62c9a5a506f6ae17"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.4/termchat-v0.5.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9aea46c86dc3750de0b40f6149af21849057271399ae23cff6055aac58ef6111"
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
