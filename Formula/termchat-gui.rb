class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.5/termchat-gui-v0.5.5-aarch64-apple-darwin.tar.gz"
      sha256 "461e2b945ffcdb786d58fae34338b63546c4afc17dcf3162416dc0c3b7a3a8aa"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.5/termchat-gui-v0.5.5-x86_64-apple-darwin.tar.gz"
      sha256 "0e8699f2b51d10b1d8962207a2a91fdbcbcc85f52dd48dbc9a2c45b60a0ea4f9"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.5/termchat-gui-v0.5.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7b37c188eb87474f8a925e98371c1450c0f38fa77c7e407ee9c531aec836d227"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.5.5/termchat-gui-v0.5.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d8cd7bf1cf8646816582fb8aa9d366da0a8ef292f06940bb859cac52eef27a7e"
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
