class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.2.2/termchat-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "d87bb1433d71d3149ad10bd7512a119028749eafbd5f98c71ddbb70e7bf8ecd0"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.2.2/termchat-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "5b42b10bbbb76ea033a7b75e092efe9d1ba3461573652cdbe3647e35950933d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.2.2/termchat-v0.2.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "86ce59e2292737eafb2b5cf803eda77f1a963ed6b736b57c572b45eb177c5e48"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.2.2/termchat-v0.2.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fa8738ed8f1553eb9122b200526b3dce306d797728f8e304128b735e664cb9c9"
    end
  end

  def install
    bin.install "termchat"
  end

  test do
    assert_match "termchat #{version}", shell_output("#{bin}/termchat --version")
  end
end
