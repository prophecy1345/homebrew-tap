class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.24.1/termchat-gui-v0.24.1-aarch64-apple-darwin.tar.gz"
      sha256 "9a014d4819409b2f8abd6b52e6e24ee71c085a84894865bb43c17c0c572fdd59"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.24.1/termchat-gui-v0.24.1-x86_64-apple-darwin.tar.gz"
      sha256 "29f763daff714e242780accd4ba7f647c979963d3df2cef5b007f88670b95b6c"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.24.1/termchat-gui-v0.24.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d03b637998a7b0e094f5fd2ce0a3612cbfab709ea2a1f0bbd763c82d8a5d11e9"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.24.1/termchat-gui-v0.24.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "70c5165ea1b7be2bfb90aa044d6fe04331239cfd55223dac3d05a2d93f8b8fda"
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
