class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.2.3/termchat-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "f590f4b5ce7f2d02080d63be7b0e59cd537d05f25b1c28eeae4051a148d5308d"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.2.3/termchat-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "43e80b55c2970d56c798be520862d42d618267a71215fa9f141e361f231b7c17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.2.3/termchat-v0.2.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8b0ea19d4f00233bae37bd6875d9d59647a9817bb091000d6ead75eef705706e"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.2.3/termchat-v0.2.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e0632ff9c7dcc17e481e4ff1ff39f81cbfe2e9186bddc88c0dd87cba4f1dc34e"
    end
  end

  def install
    bin.install "termchat"
  end

  test do
    assert_match "termchat #{version}", shell_output("#{bin}/termchat --version")
  end
end
