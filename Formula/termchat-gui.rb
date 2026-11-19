class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.3/termchat-gui-v0.17.3-aarch64-apple-darwin.tar.gz"
      sha256 "29cf3abe12edd77e07431b462df89f61d13497c312109f2a1d0e886e5ccd4832"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.3/termchat-gui-v0.17.3-x86_64-apple-darwin.tar.gz"
      sha256 "881d617714c854f988268cf2388996a9ee9ccb07542076b07f80019809e97651"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.3/termchat-gui-v0.17.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf2bec1651623ed7502e6f8bfa6695231ddddc4df796b122210bb5c8ab8f02e8"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.3/termchat-gui-v0.17.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "979e756633fc8335d491d257a68335e1daa766e7364f4d01db4ff404516d32e3"
    end
  end

  def install
    # lyrebird stays next to the program (ADR-015), out of bin, so it does
    # not clash with the terminal client's.
    if OS.mac?
      prefix.install "termchat.app"
      bin.write_exec_script prefix/"termchat.app/Contents/MacOS/termchat-gui"
    else
      libexec.install "termchat-gui", "lyrebird"
      bin.write_exec_script libexec/"termchat-gui"
    end
  end

  def caveats
    return unless OS.mac?

    <<~EOS
      To find termchat.app in Launchpad and Spotlight:
        ln -sf #{opt_prefix}/termchat.app ~/Applications/
    EOS
  end

  test do
    assert_match "termchat-gui #{version}", shell_output("#{bin}/termchat-gui --version")
  end
end
