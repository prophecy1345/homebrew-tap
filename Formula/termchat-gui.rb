class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.13.0/termchat-gui-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "5bdded2a9399a0bd6dda32a9cd8ea07e675e3e947565b30122de58788d1fce9d"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.13.0/termchat-gui-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "05fb27a1205b545d394fd468fd9d4465d1714f53728b01525f97a51debcbbab7"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.13.0/termchat-gui-v0.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a3edaedc53ee2456398b528c3cbcde510dc3a401e426572b36e6a7822d5ad0b2"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.13.0/termchat-gui-v0.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db439f20c36a915ec34c8e7579bedc1a19e829e1610db2df323c3ab240cff8a1"
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
