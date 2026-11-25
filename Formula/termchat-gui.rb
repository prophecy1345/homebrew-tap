class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.36.1/termchat-gui-v0.36.1-aarch64-apple-darwin.tar.gz"
      sha256 "d627191c0633e0ee4d80d2970dc1558d4f041ad4c92603486701f65159916ba0"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.36.1/termchat-gui-v0.36.1-x86_64-apple-darwin.tar.gz"
      sha256 "22fe1245db5bb72f75a01108ebb86520db23fee0740f25485fd3e3ab5e4d8aaf"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.36.1/termchat-gui-v0.36.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "84f8b64fb530e1f7126ea7a0ed310201f0d916d208536a4f54db0f4e2931a43e"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.36.1/termchat-gui-v0.36.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a261d71f50045725319b4be76a6daca8f42d58a45061c6b411ec48b110adca6e"
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
