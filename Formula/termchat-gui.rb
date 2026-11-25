class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.0/termchat-gui-v0.37.0-aarch64-apple-darwin.tar.gz"
      sha256 "5625d32b40e285b548712917733283b85314dda98e3d865c946813287990f968"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.0/termchat-gui-v0.37.0-x86_64-apple-darwin.tar.gz"
      sha256 "cd4c07e081282420d0fcf6d7444b19ba3c8a63ef2f06e51f66cb15011576fe49"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.0/termchat-gui-v0.37.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "51c14eb109140def5e01590092d45ed30ec240613b47ff568c3fca935847278d"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.0/termchat-gui-v0.37.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "126e3c2e42f8146c90a6c58a3f38b548d43f4a3b817985ca7d6cb69331b896fb"
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
