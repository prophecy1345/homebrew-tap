class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.1/termchat-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "a8e8566ce83850f1da7b2aec11ca6311c28fa03bbdbb324ae437dac503c4f8c4"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.1/termchat-v0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "ee2ec09e0ec17f4c628f98d520192d0581d8aee8683aa404ccd2e4e3e250b86c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.1/termchat-v0.5.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a0dfd88b944a7739009e9faf6653cccf11080c24ca514d3e79c7a6c8790e4b25"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.1/termchat-v0.5.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ef86b88799c53220c96586b7a6df8dfd07353c83a87b89f169f56f86a0b922b3"
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
