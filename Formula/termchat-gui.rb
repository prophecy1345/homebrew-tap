class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.4/termchat-gui-v0.5.4-aarch64-apple-darwin.tar.gz"
      sha256 "90a9cfc058d5c85d07f10649ea0c8d67b4fc11b7390b886798660589ab1cdf94"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.4/termchat-gui-v0.5.4-x86_64-apple-darwin.tar.gz"
      sha256 "595f404d52cb82befe068ea55e066dfba3300cf1bd2b84d58d90d40d7f97f40f"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.4/termchat-gui-v0.5.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "592c762e0c7c1753d5929c2e2b800009adff8f3b505430b7daff0e9c1082c1e7"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.4/termchat-gui-v0.5.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b39f46ef6c4728c824e76d9c5cc22f2748c6442c005108f14cafd8d16d603bc6"
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
