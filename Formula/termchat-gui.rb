class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.1/termchat-gui-v0.37.1-aarch64-apple-darwin.tar.gz"
      sha256 "d05bfa3e9d633bb0c5fbdc7f956694f0522b2c1857c70b83d0c8726af08f263e"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.1/termchat-gui-v0.37.1-x86_64-apple-darwin.tar.gz"
      sha256 "0f106547a1ac46ae146d1c957a434c6e8a7b1dc1bab9fae2c7b45ebfbe998f6c"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.1/termchat-gui-v0.37.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9616088428a5ecdf4303b6be1985281c523532a198eb1348d8e7c738c3155329"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.37.1/termchat-gui-v0.37.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98401766d7c7ce1658c8e4c092518cbee710d8854301e73d4cbf7df015a3da8d"
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
