class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.0/termchat-gui-v0.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "578b52c046e19252698f0c3d00de642255a8475671d913568446f8d88baaae5d"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.0/termchat-gui-v0.17.0-x86_64-apple-darwin.tar.gz"
      sha256 "06b7683988f716a77fd9f9cb80c92090d9b92b856860ee20889a9b5d111ad44f"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.0/termchat-gui-v0.17.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6149b1d5762bb7b7b946e380eb4d7d19d33927cf4c118b2b596d93988b4a4127"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.0/termchat-gui-v0.17.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9fe49a3acf8b51e31db18ed18f91bc7b8314de196135466edaae6c53915c49dc"
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
