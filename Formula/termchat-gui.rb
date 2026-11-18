class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.12.0/termchat-gui-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "062a6f13dcc018d1a8eb1c2dd59000819d3d27949f44556ea7dc5e0feaafd68f"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.12.0/termchat-gui-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "1fcb9edaa58fafaa91b242d143506f270893b502add7f44aa60eef64f5384a6b"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.12.0/termchat-gui-v0.12.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "86dadf43e505eb5ce257920b97a68d56f3434e20e283afead668289ed9bb7e6e"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.12.0/termchat-gui-v0.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c13bb6ac38b318c4601ef267c1f11232c2f55f156097c53486763357112c83a"
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
