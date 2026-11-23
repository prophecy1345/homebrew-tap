class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.27.0/termchat-gui-v0.27.0-aarch64-apple-darwin.tar.gz"
      sha256 "f1df32014931634c3de912e4200ab6e7d2484bcaf067d267f6ee6716318ec387"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.27.0/termchat-gui-v0.27.0-x86_64-apple-darwin.tar.gz"
      sha256 "0a4cb0565b2c318647312c88a764f6b57f35427252281f13cf7a7b3ec5a0b1ae"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.27.0/termchat-gui-v0.27.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e8f09d6580ea9ad23a4f886c19b608697c6b389fc0632afd390a2d1a7fe89fb2"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.27.0/termchat-gui-v0.27.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a6e3743420f169e7fc67871aac9751a434f64266a905570abd34eee51f85c1a1"
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
