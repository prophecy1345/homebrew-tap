class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.16.1/termchat-gui-v0.16.1-aarch64-apple-darwin.tar.gz"
      sha256 "3b8de338865cb15e933bd68ba9e91b87fd538bf171650362ff5598286e627ac9"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.16.1/termchat-gui-v0.16.1-x86_64-apple-darwin.tar.gz"
      sha256 "a7cdb18e1b9c571e70ade7833f6c85f4571661c507d69ff9bd00c2c07e1d6ee5"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.16.1/termchat-gui-v0.16.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f351bb60763351bf195e0e91c08afcab4614aeaa56aed1390f65e288d74e5787"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.16.1/termchat-gui-v0.16.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "33ff96b34413fec417725996b0adf65ae56923abf87e125e80708dfd11adda83"
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
