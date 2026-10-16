class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.6/termchat-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "d16aecadcf8f5cde005291a9e1aa7abe49d47ea47d6d0c241fb362d122acee09"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.6/termchat-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "9192841d24dfd428d5d86ee313f500d102b468eb28604b592e5e1ac2b272abd2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.6/termchat-v0.1.6-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ce7ce90978015ee3c13884ce88f4373c08a5cabb6d39036712995e9b0caa6e6e"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.6/termchat-v0.1.6-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0c3139f16524b54590a80b75254debd5ca9f9ff9fc4cd4d11d9330db13d4ebea"
    end
  end

  def install
    bin.install "termchat"
  end

  test do
    assert_match "termchat #{version}", shell_output("#{bin}/termchat --version")
  end
end
