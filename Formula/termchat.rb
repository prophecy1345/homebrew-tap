class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.2.0/termchat-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "a1b9afe76ced6779835d046ea57a61acf535366c900916a344844c40d6250b03"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.2.0/termchat-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "ba987c103d66f85b056c1b23a9f54211137ebf7a1809e5af0c526a8492500409"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.2.0/termchat-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "331625bc621425ce8d0571f205812dfb82a513782ff7d58bf65cf341a00fd53f"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.2.0/termchat-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1267cd88644781ee0e46c60aff2a991a48c9a851d48617aa0acc58f68fcc9c8b"
    end
  end

  def install
    bin.install "termchat"
  end

  test do
    assert_match "termchat #{version}", shell_output("#{bin}/termchat --version")
  end
end
