class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.6/termchat-v0.5.6-aarch64-apple-darwin.tar.gz"
      sha256 "4284412a620964fa729191b2759e862f0058ede826b73d3bf7a34a3558355f4f"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.6/termchat-v0.5.6-x86_64-apple-darwin.tar.gz"
      sha256 "52f5946f28dfa53bc60af108242769da92c8d6d65b33431f9b7f80e04742de2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.6/termchat-v0.5.6-aarch64-unknown-linux-musl.tar.gz"
      sha256 "990bd841352c69dc86ba38ffde7f04b0a7382107c625e87240179fe7ab6d20b7"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.6/termchat-v0.5.6-x86_64-unknown-linux-musl.tar.gz"
      sha256 "83c761c365d77366da5223d60b3b406937a855a4c96a5252f07afecf4909213a"
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
