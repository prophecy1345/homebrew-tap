class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.3/termchat-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "08155e214585ea5b72436008946d940c5f64272ae8b0223a7f4115fe7807c075"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.3/termchat-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "b84a374eef228e2bde12d1e8447b013103d0a04d0b87605c8b8e8ac54fb7bc81"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.3/termchat-v0.1.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4959825ca36bdbaf3e4116cd8c4f6a0379c630153061bb73f32af8d2287710a2"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.3/termchat-v0.1.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "394224cacd6edefd8ae3d819c2849bf1c19d4cce3542f2517fef673caec02bbb"
    end
  end

  def install
    bin.install "termchat"
  end

  test do
    assert_match "termchat #{version}", shell_output("#{bin}/termchat --version")
  end
end
