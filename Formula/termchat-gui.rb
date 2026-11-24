class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.1/termchat-gui-v0.33.1-aarch64-apple-darwin.tar.gz"
      sha256 "ca9323f46d36ea89ba4df5fcfe571ccc2d5ec8db94f8ee584ca78b4613117d32"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.1/termchat-gui-v0.33.1-x86_64-apple-darwin.tar.gz"
      sha256 "50bc2638752a3d0cc41c32ef296a5b34254346f81a1732d3e7de4a51c75e17a9"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.1/termchat-gui-v0.33.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a3489ef176f092605f13f406494703a5e5a79f394036b917ef89a7653418d21"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.1/termchat-gui-v0.33.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "87c2bbbad6433b7ec3552f8db8c8c4cc8052ecf1469e60395d06f6a5993e46cb"
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
