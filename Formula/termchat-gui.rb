class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.1/termchat-gui-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "78848bda2f2869907835550a33fc1e79e4c313d85544287797111d3554b0e28d"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.1/termchat-gui-v0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "de770582bbd1c2ceaf2656b7025a9f8395d747147f0c0855f8880ab4c7f5ebc4"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.1/termchat-gui-v0.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9ede560cce1a66c71154aed8587e03fb620cb84773400405f19b82c2bafae31b"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.1/termchat-gui-v0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ade1665054caef5bb87dae7dcd21d6ea83ed1d62ed0130b8049fbca6efc3a733"
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
