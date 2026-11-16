class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.7.1/termchat-gui-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "40a4ad070fe59002d0a18e742d1943c1a88bd558d9dff1c59e4c69577fa862bf"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.7.1/termchat-gui-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "091255243721f3056506eccbd03928f3db12b1da1a5787d2c7214a6c1a483de1"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.7.1/termchat-gui-v0.7.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3761600402801b79c685ab6fca756f703ab4ce8603a595297f2d19d1de131f8d"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.7.1/termchat-gui-v0.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "34b7078a8f69d195863a7da2cb061cec29ac7c37c871dfb0054e95fe20e5f748"
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
