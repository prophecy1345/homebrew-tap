class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.19.0/termchat-gui-v0.19.0-aarch64-apple-darwin.tar.gz"
      sha256 "890235606ebbb02dc10d4cb49dd10706dc81dc5928180eb3697b7920e9694feb"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.19.0/termchat-gui-v0.19.0-x86_64-apple-darwin.tar.gz"
      sha256 "13d3f8f2ee75371b135f4f7944dd925bb5ab58535a93d040b61f60ac079e2069"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.19.0/termchat-gui-v0.19.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "95bbac203f24fe717f5ab67011e5147d8f30012c7230b082e4a78225a153e3cb"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.19.0/termchat-gui-v0.19.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "951326c0c06a15786396b32a3bf906a351b5226cd57611b6633bd818bc81e8ae"
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
