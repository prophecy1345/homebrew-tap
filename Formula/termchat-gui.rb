class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.2/termchat-gui-v0.37.2-aarch64-apple-darwin.tar.gz"
      sha256 "99060265b7d57f3b8f82461db7810013b28363fa585137369535b969a436e4d6"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.2/termchat-gui-v0.37.2-x86_64-apple-darwin.tar.gz"
      sha256 "afabaaab16ee70a123f5f410f4b568d13a8c9d278228d76feff5eb31105ed988"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.2/termchat-gui-v0.37.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6e8405e3db6d6e93a77694d4b66f54aee9a2794d3956fe4be3ec26c54e75557a"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.2/termchat-gui-v0.37.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "856c33f9c0467cbef165fc98ecd558aea835296caacefbd550323e0d6185f335"
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
