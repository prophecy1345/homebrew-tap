class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.0/termchat-v0.20.0-aarch64-apple-darwin.tar.gz"
      sha256 "b28e9ca138150d9830ca7e5130ffcedd457f3eed43568d562058da3e9949d0a8"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.0/termchat-v0.20.0-x86_64-apple-darwin.tar.gz"
      sha256 "422a2ff807c493a289c50df08b12694a7a57be6e6ccf10cd1be16910d0b8b93d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.0/termchat-v0.20.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ccf9926a13c49dc48ed8fbca27a7013ce4f66ff323bae5ec1ac183db1011fb66"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.0/termchat-v0.20.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d67fc8b198ff60270a9ad70f4ad47b66f120b9196f36f7705c1d1cb740c5d082"
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
