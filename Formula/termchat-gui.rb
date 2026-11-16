class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.1/termchat-gui-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "5bfd8fd177c019defd0bee765fe01a87d3a2be9f6e427f0f7be97cd00f7ae84a"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.1/termchat-gui-v0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "e74f19d7a7de4405c60006f4d2c7caa71b8da64e814ad90bcd91927d52e7ffec"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.1/termchat-gui-v0.8.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4f4507b62f2dd9c6f940935e8afd4b97cacf79223edc9da2fc017b1e5aebd443"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.1/termchat-gui-v0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d2f7432f0e52e48e13589b2114afaf0c731034c18fdf2c16d1df586a01e078a7"
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
