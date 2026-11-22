class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.23.0/termchat-gui-v0.23.0-aarch64-apple-darwin.tar.gz"
      sha256 "a1a5997ecf299c282eb3bfbf43fbdd20ab95ddc06fd6fa671f8bcc2ab7355884"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.23.0/termchat-gui-v0.23.0-x86_64-apple-darwin.tar.gz"
      sha256 "cf35d1d2bf6f22743eaea5b63e0c2aa6c88355d7931c9a3264794f0616307c18"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.23.0/termchat-gui-v0.23.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "38dc8359c1c5c60f2d3f958a7b6485d7b9748f3c9d66f4bfebf4199cb55d69fc"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.23.0/termchat-gui-v0.23.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "60095a99ee6c12df7d12e557ed23bee3f7d0ee58b807bf51956f81d16588a688"
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
