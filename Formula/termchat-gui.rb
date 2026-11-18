class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.11.0/termchat-gui-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "a3b05d082558600755680d09c66a70cfa4e0aef1045ea4e7cdc134bffebcb7df"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.11.0/termchat-gui-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "0ed5e0ed297d6ffb22e9050d3eef4d6a56d6d7e78f3bb6f74340eb8685484c4a"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.11.0/termchat-gui-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f03ed8f7ca387867c2e5bda7bb05085cbb4dea49d6d94b05f456ce7138e1e54e"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.11.0/termchat-gui-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a2cca40a8190be7bfc9fe7fa1741539823f32f9d034f8b56d35b506322b568c0"
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
