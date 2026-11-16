class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.7.1/termchat-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "bf1f8a6a2647edd666cb0a5b1790257faacdfc45338ace537c2392a918827aee"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.7.1/termchat-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "af0874fd0ff817553f2348786ddda47768a2ed602fd53932acdce0322473cb49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.7.1/termchat-v0.7.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3ba510133d83637efa4e69d2471760f885169545efbde727e8487eaff4eb7899"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.7.1/termchat-v0.7.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fde94b05dbb75112797d6e8a63558924312b1ccbfe4fe32d1fd006391e5a7cde"
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
