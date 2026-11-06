class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.0/termchat-gui-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "f6c0942949b51f22c76b376929e38f86a7daa0f21a7b3cfb9af088a7e5fc430f"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.0/termchat-gui-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "62cbd1da8ae81907235e30a39bbb3a6bcede899d7e155062ee9455090cfe8f58"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.0/termchat-gui-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f4b370800738b3f6c3b5ea9bcc1970329f31aa0775a205c5992aef3f8fdd5b6c"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.0/termchat-gui-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ef8e8ceebd0c94232ef4b6e8801d85d7b139946f0d51409b3a45cd14c012e88"
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
