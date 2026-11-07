class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.1/termchat-gui-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "1fbf1466a3db07bc4e2341dc90a338ebcb191237889cc774654e0553d8936268"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.1/termchat-gui-v0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "9fc9f1c6876aa29c403d681fcdc24a5652279ce0bc230679772cc8959b1b3eb4"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.1/termchat-gui-v0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6f4dc5f7f6372363f2978201305f7b3bed75da6e8812ba4fde35ba665d5114e0"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.1/termchat-gui-v0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c71f3db5f568d1f46242544cccd2f8fc0c1f74b71ebd2b5d73cf82ab7baea5ff"
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
