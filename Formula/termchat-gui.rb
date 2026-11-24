class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.2/termchat-gui-v0.33.2-aarch64-apple-darwin.tar.gz"
      sha256 "90ebc9f6deab1b14c671449269efc738d4a966e9ab663f0513b9e00e487668cd"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.2/termchat-gui-v0.33.2-x86_64-apple-darwin.tar.gz"
      sha256 "0e03f7ec1cda03d8ba219662ac9250f85b19dc2a9bcc63b040d1b23ddcaa1b7a"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.2/termchat-gui-v0.33.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f2e7485db68fd0f86cd71d53e37e596ae42d6b394d6b5d65fe68e4c95e5b5b97"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.2/termchat-gui-v0.33.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dba6b343666272a208c870f238fa26312bbca288b01bed33edc29eb4e5c64fa9"
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
