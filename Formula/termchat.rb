class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.2.1/termchat-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "26a3c8b322ba114978b1f57db87aa1c6eb66a4fbabd9eaef983d7fb5134de65a"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.2.1/termchat-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "b20a13b2a8bd9df1eb7ecb58b0cd2508517aa524e9571467324e61240cd1a932"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.2.1/termchat-v0.2.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ac87a6475cd81acbd48d66d407b9c3d58ecfae4db6093c6822721cebe886ae13"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.2.1/termchat-v0.2.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "928c450b992ae605e79174343b7839b30fa9151ab94f4c25af486fb383297122"
    end
  end

  def install
    bin.install "termchat"
  end

  test do
    assert_match "termchat #{version}", shell_output("#{bin}/termchat --version")
  end
end
