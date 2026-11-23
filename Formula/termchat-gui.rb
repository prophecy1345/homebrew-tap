class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.28.1/termchat-gui-v0.28.1-aarch64-apple-darwin.tar.gz"
      sha256 "cd55c18edc2bea76f7cd8d9cd4d445c5ce6200c23501146d6046c384afc5f1c3"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.28.1/termchat-gui-v0.28.1-x86_64-apple-darwin.tar.gz"
      sha256 "4fbf04faf8b7abefd55a2be605691ccc3b243320c3d0d504534c1c7f9f813f93"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.28.1/termchat-gui-v0.28.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fcc9d4f82fb8eb8d3a58d3e62e419c533e81da0566d0b57574277dfa25eadc3c"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.28.1/termchat-gui-v0.28.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2de801866e6aab2969ad670582d76e002b0d863f3ed8cc5a88a0cb2e19d36ce0"
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
