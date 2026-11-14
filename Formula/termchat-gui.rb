class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.2/termchat-gui-v0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "44fa7c703b61638d14cda13bed8b9713139ff9250ccab1d1b4378cfcd0239d2f"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.2/termchat-gui-v0.6.2-x86_64-apple-darwin.tar.gz"
      sha256 "742d025eb79649f9e32c548b2c25c1982e09bcbd4b739e5bd0a3f8edfd3d9f7c"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.2/termchat-gui-v0.6.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "11f61a70ca9e3194ba943b0ca97f56147669584dc119f48b28df1b27ba0441d9"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.2/termchat-gui-v0.6.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f102f79001bbb7f95c572828ab1ab91d0e9830125134b58ad927b8d539113e54"
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
