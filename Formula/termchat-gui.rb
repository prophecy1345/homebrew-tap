class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.35.0/termchat-gui-v0.35.0-aarch64-apple-darwin.tar.gz"
      sha256 "150a7b2d9166fa2c804cda206774be33e84bf9c8c4c10805095e91d425968772"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.35.0/termchat-gui-v0.35.0-x86_64-apple-darwin.tar.gz"
      sha256 "aa61d8eae48c0d0ef856898c9d24fd0a836f271eb05c7d95946f3c36f321d9e7"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.35.0/termchat-gui-v0.35.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "98f7bca2001a7e752e52b9beb99bd37cd6010f08190dd051a7cfbcf05ce46786"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.35.0/termchat-gui-v0.35.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "730e18afc1f1baddb4aa937b462794c3056cc612592a3c0708d787f3f3699ec9"
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
