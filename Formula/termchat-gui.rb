class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.0/termchat-gui-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "328a0814371cbb00617a63a1607969ce827febc92a006ee42b28e28e08a1ab45"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.0/termchat-gui-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "d8c2fe0fecff704801b68c333e16eac0bcdfb7dd7fb14dbc7510eb4c9165091a"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.0/termchat-gui-v0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da7290768ad41541b26b3eeb9a2cf2bfe304112bf8a4bf4a3d3ec0bea755acc2"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.0/termchat-gui-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "abecb12944173b6723fd6c2158df382ba857dfea6d66ff96256460925532f696"
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
