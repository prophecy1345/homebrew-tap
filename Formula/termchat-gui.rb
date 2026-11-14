class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.0/termchat-gui-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "2369b5e77c84bda45cbb1a5ab7eb89358a6170fbfca2ee4ff9f311821c08b51e"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.0/termchat-gui-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "55ef039a54787ccae3d52db31fbdc7c2f6748b5fa0a687cb1334c37c761f6ed3"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.0/termchat-gui-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fdde00cc32035643100b83ba4b1a929acc57984d649f69f5a071df89dc8e7f8f"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.6.0/termchat-gui-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a2a113d5d9f3a15073a14812093ab4251975752788635b3c3fab7d9035a7c6ce"
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
