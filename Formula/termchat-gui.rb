class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.2/termchat-gui-v0.20.2-aarch64-apple-darwin.tar.gz"
      sha256 "35b163e45497d52da46a8a5004748bdc8e99b702b5d2c2fdcf808d4269fbcfe8"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.2/termchat-gui-v0.20.2-x86_64-apple-darwin.tar.gz"
      sha256 "fac1aad0b255bc0743facb973b87b241dbec837fba085d203ca78226e54af972"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.2/termchat-gui-v0.20.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "64ce09cea84f3d512548006cb315eaf874986ca89afaac2155357e00adca63f7"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.2/termchat-gui-v0.20.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d2ca127644aa43b8920591a32790326a2f2dd6700d1b4b65d8430d634c057fe5"
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
