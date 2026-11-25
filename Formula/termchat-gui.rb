class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.34.1/termchat-gui-v0.34.1-aarch64-apple-darwin.tar.gz"
      sha256 "403b493ce3ee92f3dbf93923ef465e7efdf15c78ef59edbe0aa046d21772d898"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.34.1/termchat-gui-v0.34.1-x86_64-apple-darwin.tar.gz"
      sha256 "bf56d6026bc454f2357480c4498f49dc0b60a390d16b8b7e3269e574a4228b8a"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.34.1/termchat-gui-v0.34.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fb71649e0583199bcae12d5c080c795b963ca5852f3be520cb02df1e5242432b"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.34.1/termchat-gui-v0.34.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8ee8041c026e38cdf14689e0eec7b0aa9ada3f43505f37b0d2892a44531db85b"
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
