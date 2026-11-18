class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.2/termchat-gui-v0.15.2-aarch64-apple-darwin.tar.gz"
      sha256 "705eaf5a075b51bd2d3928b764a36d2bdbff46c15f8bbd843d3603623ff48903"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.2/termchat-gui-v0.15.2-x86_64-apple-darwin.tar.gz"
      sha256 "c04f8acae3d1cd42399a733dd675ba0902e3827b8cfd0d2a72b29339326490bb"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.2/termchat-gui-v0.15.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7eb3e1afb98fafa619a9085374f36e627ca858e10b097cdcd5cd316a86a7391e"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.2/termchat-gui-v0.15.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ab38961fd6909946fff5bb796e716500e2ee06eef8a7a0af38783570aa75cd70"
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
