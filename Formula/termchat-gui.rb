class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.25.0/termchat-gui-v0.25.0-aarch64-apple-darwin.tar.gz"
      sha256 "80e4ed5d492324a5be0f644d1edf7736f5681d6390a6d22424b6b7a22a1dd868"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.25.0/termchat-gui-v0.25.0-x86_64-apple-darwin.tar.gz"
      sha256 "b3c075b639ad37561e7402a0814962e7ba798151b1d5813d6d87778878466a82"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.25.0/termchat-gui-v0.25.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4a67364d6bdf245377fb7b99bfd033b9ba4239f38b880fba19ffa5cf4e208c74"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.25.0/termchat-gui-v0.25.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e9b0b9187b551d7e166cf75080f2f28ff6b30f60b5408ca95df9a379ade3a10"
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
