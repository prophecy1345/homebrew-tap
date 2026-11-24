class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.30.0/termchat-gui-v0.30.0-aarch64-apple-darwin.tar.gz"
      sha256 "0363da1c9145e920b3f66abb177552ad6c01bfa4851e155f9cf5cbf44dceca22"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.30.0/termchat-gui-v0.30.0-x86_64-apple-darwin.tar.gz"
      sha256 "3d58c5c1dbe6cccf1810cfc4c6a64c20e8b2735ba6855f142c214bb9afc0c350"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.30.0/termchat-gui-v0.30.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "38b23b951c36ca963ea7f5141b6c9d8c2363453e9d9fe8a4d168be20e431a53d"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.30.0/termchat-gui-v0.30.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "511ee023f7b3c20bbab55b346fae1a47fc312215383f997b940cce95e9dc664f"
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
