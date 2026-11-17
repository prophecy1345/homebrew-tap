class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.10.0/termchat-gui-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "a9a1b98deb4e24a67281116185fd96b85f9e725ea4862aa07837902f155a135b"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.10.0/termchat-gui-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "93d7cd9a9adc131dea78ac4e88fa7df5237002659ad15ddfb18c45c5f0329c38"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.10.0/termchat-gui-v0.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "01aceae6c037f3d2ccad7d76eb1a941e27dce103cd1bf6adffc0a58b2761df8d"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.10.0/termchat-gui-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6643b8b1dfadd8726b1ff100d2ff3397f3d257a5b9f156344fe9ec02477900cf"
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
