class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.16.0/termchat-gui-v0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "9c405b6df5d34c22688570bfcd5ec2cb7eb7d840086171639687b4918522f3b4"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.16.0/termchat-gui-v0.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "34a432ebea589bf483fcb10b80d966bb16cf32f24bedbb2f9a94c705ed54f3b3"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.16.0/termchat-gui-v0.16.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "32cf6f3949f5e9761d8816759dc43864cb096f0cb6c204f968cfb2906859ac46"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.16.0/termchat-gui-v0.16.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1f6540d59c6252549d94e19bfb5453993100a3bc194bf4041b14368963853210"
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
