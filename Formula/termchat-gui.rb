class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.39.0/termchat-gui-v0.39.0-aarch64-apple-darwin.tar.gz"
      sha256 "e73889d203a632933d4d4cffb4e9fecc8c78c18ef9fd8466f2ec9a82434f5bba"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.39.0/termchat-gui-v0.39.0-x86_64-apple-darwin.tar.gz"
      sha256 "9a4a34aa22cfbf40b30b715a587ee4d64dc93a4c92c82f6880f0e9784511b1a4"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.39.0/termchat-gui-v0.39.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "552d29c01157a9070df24cd050d6801fd2a3049ce3d2b6cc84c1072414d238ff"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.39.0/termchat-gui-v0.39.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cdbc99a0ad79e17285d7a3f8cb323cea0fba55d98b2ca85a62114c90156dc128"
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
      pkgshare.install "LICENSE.Hack.txt"
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
