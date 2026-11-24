class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.29.0/termchat-gui-v0.29.0-aarch64-apple-darwin.tar.gz"
      sha256 "0c7220aef84f4e690d0286e26080f5450cafba925f2b1381775b1c7e3ba9fa74"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.29.0/termchat-gui-v0.29.0-x86_64-apple-darwin.tar.gz"
      sha256 "0516da42e0d0a5ea43ddc1f11b5333720a3b216709b4814d33b6d089fbc22e0c"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.29.0/termchat-gui-v0.29.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b9befbce65fc5271130a106e61320f441fde6696229ea666facefd801460d11a"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.29.0/termchat-gui-v0.29.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5c85a8684a6f88c808711725b2fb1ed1698c2f8c328b3ce1939deaf32c042846"
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
