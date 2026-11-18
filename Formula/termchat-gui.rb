class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.14.0/termchat-gui-v0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "ed92336a8552ace773e86968b8ada9be8782d78dcb915692cdc8a55d04aea996"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.14.0/termchat-gui-v0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "a8b287a56382817f3ce5a7a7b8369874941dcc366bffb6b3663af411677da877"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.14.0/termchat-gui-v0.14.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "567b5744b3fadf333558a7dfe68a056c073cebe060d26168e5858084003b30a2"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.14.0/termchat-gui-v0.14.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a3555fda0cce949d01d539aa220b72415bcf01e944ff195a2070c4609fed6756"
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
