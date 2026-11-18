class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.11.1/termchat-gui-v0.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "ba46a0726e9afaa60d1f6acb1cda890932e6ee1f59cb2227120d924fa2214009"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.11.1/termchat-gui-v0.11.1-x86_64-apple-darwin.tar.gz"
      sha256 "7ed3d7bc8cf41ac27d5493b0b2a3a5f48fd6b901e6104ace3de0b4a4bc747cb2"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.11.1/termchat-gui-v0.11.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "69b0bc48d0fce9f60d02117d3c927ca1ffafe974c4c2651e94455c67c307ddca"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.11.1/termchat-gui-v0.11.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "147d47045f7945466184ab54a7aec200501d0aab28372bb0ed8bf0d96561eab4"
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
