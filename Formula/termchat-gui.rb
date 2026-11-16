class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.2/termchat-gui-v0.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "629d072025073dfcab1bae0a37427a04f124f118e0d863c591718e1e4db89080"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.2/termchat-gui-v0.8.2-x86_64-apple-darwin.tar.gz"
      sha256 "1939368d5067eed594bbbb26c0a723c3f7d883b13eb700ad7d911a0995526f18"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.2/termchat-gui-v0.8.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b0753a7c5389e262e1e92fa54496b6e5aa9abc448cb002550a3ad5b3b91e1430"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.2/termchat-gui-v0.8.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ba14a04126b9293f12bf47e8d344deefbd2c6c6ea27fe7240d73263fdf9b247"
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
