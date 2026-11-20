class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.0/termchat-gui-v0.20.0-aarch64-apple-darwin.tar.gz"
      sha256 "13a27799d8daedbf83c1c25fc846e01239a2491cc2301b7bebc1fc2fa06269ca"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.0/termchat-gui-v0.20.0-x86_64-apple-darwin.tar.gz"
      sha256 "289aa5f046a0579df2db433525ab845dd5a4a0bdb5f362b790cc5687d0ab5175"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.0/termchat-gui-v0.20.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b17545f9efdc2df2fa5866f2bdbd5cd1ae79033067f65e5280b4c17632e07bd0"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.0/termchat-gui-v0.20.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bf6ae51e68dc03a412c9dff29244a075271e0cd7c04c72525d2584ac49048770"
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
