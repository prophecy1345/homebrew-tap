class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.3/termchat-v0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "d618bf18007ef9121551efb97f8e85402a0a111e48f8e8615f620457291b9d05"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.3/termchat-v0.5.3-x86_64-apple-darwin.tar.gz"
      sha256 "1ec244a055652c79f7ed8917e3115ae033eefbbfda69780fccaa6f7207ffc81b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.3/termchat-v0.5.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5da44a9e65ee7a862e80cea771e0016828f4a06e1bc1b1396bdd54bcef677ff8"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.3/termchat-v0.5.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5952a67c779857cde5dbaef35c3050b0300822b9ed82cd19ace443865040227b"
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
