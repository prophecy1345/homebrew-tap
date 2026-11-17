class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.2/termchat-gui-v0.9.2-aarch64-apple-darwin.tar.gz"
      sha256 "4cb2f669d7bf1081e0d1e534f68013109d7fe9e33569832cc349dde316a84e8d"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.2/termchat-gui-v0.9.2-x86_64-apple-darwin.tar.gz"
      sha256 "6f687b4357043f162e75cff9af463b006b2116a019b789b60afb92cd7f478563"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.2/termchat-gui-v0.9.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "af20720fb7c25db805951a875e767841795940705744b7e02d4e29f240ed8545"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.2/termchat-gui-v0.9.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08116bc4da3cecf69b339a18aff96cd4f99c7d18ca06c776be15d14489a3928e"
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
