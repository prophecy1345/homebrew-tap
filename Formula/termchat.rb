class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.31.0/termchat-v0.31.0-aarch64-apple-darwin.tar.gz"
      sha256 "640d44c8c197ceba3a3df5034a4fa8bbbf5d61ab2e634b365d47f5a5a0ed9577"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.31.0/termchat-v0.31.0-x86_64-apple-darwin.tar.gz"
      sha256 "dbe99f3001f166719c3abf804f6c364fed2c476f98ea6aa3ddbfe6cd88c6e3c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.31.0/termchat-v0.31.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b1a9504f0ce0b65f359afa6bfb5cb2b54cc3a97a11557d9cbfdf3d520e17e739"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.31.0/termchat-v0.31.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6a9d969e4c3eeaa7dbba314bfda3110112f9b2561342660e8ef8a0f84cea59e3"
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
