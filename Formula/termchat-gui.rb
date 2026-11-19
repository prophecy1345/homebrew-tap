class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.3/termchat-gui-v0.15.3-aarch64-apple-darwin.tar.gz"
      sha256 "c5f6feda094212410119c85a3d7f85cb45aec18935737340e4fbe24255a210f1"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.3/termchat-gui-v0.15.3-x86_64-apple-darwin.tar.gz"
      sha256 "27529c6d55a34e1712b4a20086be23792b3c3e5144b929ebc534d8f481456c95"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.3/termchat-gui-v0.15.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd2a9c9f77002c3b4851535e2ebddec2ea664860121679404b9366f8b99db3c3"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.3/termchat-gui-v0.15.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "17474d27a29b158326b26a080fd509f8e63e9b6f39739935addaa677826d509f"
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
