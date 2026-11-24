class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.1/termchat-v0.33.1-aarch64-apple-darwin.tar.gz"
      sha256 "50d05569bcb3485aa9e2d211f4ec65820ce2a099d533b05b1339b1471ab95d2c"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.1/termchat-v0.33.1-x86_64-apple-darwin.tar.gz"
      sha256 "a8f93e3ef92d174a92693eb51cdee5983d7de57d57944dbf4aef01292ebcaac9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.1/termchat-v0.33.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "901e3781401fb71b8f88b7e241bc24d09a994de5716503d7846741c0c67b67bf"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.1/termchat-v0.33.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2432be13afbfcbfe82fd5f052fe5017400339b14986afaf7f43dbf9cadb7342b"
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
