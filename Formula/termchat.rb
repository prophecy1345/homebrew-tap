class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.10/termchat-v0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "fa3a13973947fb2e6ac58f91a924eaa526f9fd2bf90833933dafb7623a2b740c"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.10/termchat-v0.1.10-x86_64-apple-darwin.tar.gz"
      sha256 "301c290cadc58ec293ff217f74c9047c593aa502e7c32eaa79c60104e18bb2ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.10/termchat-v0.1.10-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0e2cb05fca0f03e2753c5708eb83cc2aec7a9aed8ac84d25283936e803f5168a"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.10/termchat-v0.1.10-x86_64-unknown-linux-musl.tar.gz"
      sha256 "13c050ef4ec7d3f78e7a7ebba5e1d31b5b8fef50ba9e558c6b84acb1eea4fc9e"
    end
  end

  def install
    bin.install "termchat"
  end

  test do
    assert_match "termchat #{version}", shell_output("#{bin}/termchat --version")
  end
end
