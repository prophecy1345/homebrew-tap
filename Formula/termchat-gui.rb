class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.1/termchat-gui-v0.15.1-aarch64-apple-darwin.tar.gz"
      sha256 "adf0fe2f81c327505519abad12641162293cfe2937bd530174b2db42349afdae"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.1/termchat-gui-v0.15.1-x86_64-apple-darwin.tar.gz"
      sha256 "3a03df871da69898824ec0534c2a92a75e3d9a4af1cd1f4eae3b81e97cc75464"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.1/termchat-gui-v0.15.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bde3b7b18b7b3b2940d847e8a56fddd06c6bec6e17c93caac88a0244496da187"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.15.1/termchat-gui-v0.15.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "60d5b25860211516ab8086405979bbcaf85b7e859c75db34f484c1cbeff51214"
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
