class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.1/termchat-gui-v0.20.1-aarch64-apple-darwin.tar.gz"
      sha256 "b0377854d568206c41fe4bec0790a43427d8a122ed24942f84eb7b070024dfcb"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.1/termchat-gui-v0.20.1-x86_64-apple-darwin.tar.gz"
      sha256 "9e457fdc62797e2965dcb38a68996d90aa7e536b5cb41bf4c9eb700edd85dfe3"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.1/termchat-gui-v0.20.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5f95f6f9dddbc8f2852f1c417ed2e472a3ebcf0b087170ae09e4c3ee31cb43dd"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.20.1/termchat-gui-v0.20.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f544fe6eafc619b3abb7366403ef3af42892e3b234c4e4f8bdf518ed950a2a75"
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
