class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.3/termchat-gui-v0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "d60c3a651c0d6a50d3973c8aff65e62feada4bc99b8defbd224c37bdab331b37"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.3/termchat-gui-v0.5.3-x86_64-apple-darwin.tar.gz"
      sha256 "9528bfca8258469e5cd17e120f82257b34cb1ad6eba696760259cd9644a49177"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.3/termchat-gui-v0.5.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1b5340379e723ea681d9ac08d4ae0f75a3525693b67159ddf8980da7b591ddd5"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.3/termchat-gui-v0.5.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cc9b05167b2e62f24ff58f5c31401776b508d0e5f98098d903774a542050f89c"
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
