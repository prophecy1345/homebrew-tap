class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.26.0/termchat-gui-v0.26.0-aarch64-apple-darwin.tar.gz"
      sha256 "fa01e8f2e9577622eda4192f150089570567f7a2604a140af22778edfbd44793"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.26.0/termchat-gui-v0.26.0-x86_64-apple-darwin.tar.gz"
      sha256 "b3ec9a645f2dc617254c77421e23cff37d3839f9a092104f044cdd1a8c1826b5"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.26.0/termchat-gui-v0.26.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf45031b41dbaaddb4191c992ec0c2b8ee3bd85e14017069a3c6c1b88051210b"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.26.0/termchat-gui-v0.26.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f86e5205ed36d21ebc7dfbf1840b6c8d1be7d398c22846aab0b9b88ddc6538b"
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
