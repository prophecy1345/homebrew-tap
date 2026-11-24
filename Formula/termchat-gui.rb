class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.32.0/termchat-gui-v0.32.0-aarch64-apple-darwin.tar.gz"
      sha256 "06be81534425e4aa5d4ea28528b0677ea5f9d5a7ed87f1d646bea36fff8cb63c"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.32.0/termchat-gui-v0.32.0-x86_64-apple-darwin.tar.gz"
      sha256 "7d2cfc550cf75e9209ac89527df874ec196d01b1a43bb7ce7538493dcf82b152"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.32.0/termchat-gui-v0.32.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a2e60b163be68c9a723ecb1d91c2b939a6b6827153008facd8cc27a7d93ab81f"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.32.0/termchat-gui-v0.32.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "57a8882e0cdf2518d339b62abe961e28cf4081b7320fabec3ed28856ccbf6824"
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
