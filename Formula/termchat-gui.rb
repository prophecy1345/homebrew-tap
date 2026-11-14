class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.3/termchat-gui-v0.6.3-aarch64-apple-darwin.tar.gz"
      sha256 "43376b5ec5adda52e043524445e6f335e7b5a81d9e252fae139e38d15fae9ca0"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.3/termchat-gui-v0.6.3-x86_64-apple-darwin.tar.gz"
      sha256 "d9d84ab5e58699e88863cdfbb16a18bfb09928f07cee9abdc024bd9a74c1aafe"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.3/termchat-gui-v0.6.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2f7c675af48cf72ba2e878f20a9cd93f3a3aa70faab8c382a9ef2bdb7dd07412"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.3/termchat-gui-v0.6.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f83d386988963aebb41bee62ff13437e46f68d30c09b6b58540e7175c556411"
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
