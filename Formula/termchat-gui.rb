class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.7/termchat-gui-v0.5.7-aarch64-apple-darwin.tar.gz"
      sha256 "696fb36bd909e433d80ae45362786e6cd4669746630ce1609359b69e097af4bf"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.7/termchat-gui-v0.5.7-x86_64-apple-darwin.tar.gz"
      sha256 "c0f2b7ed13df484d688516005bb04702a9049a7ca6ddacc681370905f20b1d89"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.7/termchat-gui-v0.5.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "afde776399a3611bc884281e4a8fdf7b3914bab498d25326c0f2465a5915247f"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.7/termchat-gui-v0.5.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "092d3f4a0b5300bdad1e827d4cc41ee0a30974f6bedf95916394193cff55dbbf"
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
