class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.1/termchat-gui-v0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "7f955b834ba7b5847bfc57c3f5979e1b2474bab1d432dd5271bb61cbf3e4e74a"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.1/termchat-gui-v0.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "e1f3ba10266bcf74275a45ced9b92a9c43a17f111954a1fd97c5c7efeafe24d5"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.1/termchat-gui-v0.9.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f64df297008041ae037f4440fbba516cafc6c67c33fc8373555f02a375376ffd"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.1/termchat-gui-v0.9.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed822b62e53981aa736e4c48e96da05b785b29f571c2866b9ade7a8ba8ce8190"
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
