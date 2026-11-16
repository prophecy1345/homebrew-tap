class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.7.0/termchat-gui-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "de19624d3ec13b7985dab81a6430c565b07d68ade8ee39850fe543123b983020"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.7.0/termchat-gui-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "0a5b945eb9268f2500ee20f38ea24644766ed381dce72978348ee7201781129a"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.7.0/termchat-gui-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3a9cf1c940577d90fc937d195299b350109d893e30d5fcf80ade295189cead8a"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.7.0/termchat-gui-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "005b1d7d931a02998e58a7670ee996c66f680cc9abd40130cb9f22fc0ea85c3b"
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
