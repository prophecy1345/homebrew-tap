class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.6/termchat-gui-v0.5.6-aarch64-apple-darwin.tar.gz"
      sha256 "3d264ed7e39cc0fef0b185d9995191b5430ddd648da328f0f89a1fac0ed0d292"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.6/termchat-gui-v0.5.6-x86_64-apple-darwin.tar.gz"
      sha256 "e5566ce50c742535a4e5f4f87d48b9fda9b13ab025745e6c9c6a7ca786489084"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.6/termchat-gui-v0.5.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5117b8770ed9b7e421a346e9651a73d7ca7979bc133009d4f5918f9d0b39a467"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.6/termchat-gui-v0.5.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c82df298fde385caddfbbf77d539db9b782a8778e81e082bc861937bffa46fcb"
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
