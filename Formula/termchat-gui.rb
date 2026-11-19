class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.18.0/termchat-gui-v0.18.0-aarch64-apple-darwin.tar.gz"
      sha256 "cdc8c55e39b56d501f543a74e2705e0f4ce3546be8c7b974bfe55b8477bff699"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.18.0/termchat-gui-v0.18.0-x86_64-apple-darwin.tar.gz"
      sha256 "da55ba5690b0d3d7d33a6338280d8f017be5fb66da682806301e3565945822ac"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.18.0/termchat-gui-v0.18.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cd395044eff00d946dd2b78451838ce64b99fe6e6f555ef15ef194d17ec42cd3"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.18.0/termchat-gui-v0.18.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3351ba26a2eb970bf2a248d186394fd9a8d38903fae3e8ddf5096762b026e820"
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
