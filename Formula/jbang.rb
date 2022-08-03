class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.96.3"
  url "https://github.com/jbangdev/jbang/releases/download/v0.96.3/jbang-0.96.3.zip"
  sha256 "46ef0703e2aca8a216270116b2e6a5aa2bc098848bbcc52ce718b2749525b109"
  license "MIT"


  def install
    libexec.install Dir["*"]
    inreplace "#{libexec}/bin/jbang", /^abs_jbang_dir=.*/, "abs_jbang_dir=#{libexec}/bin"
    bin.install_symlink "#{libexec}/bin/jbang"
  end

  test do
      system "#{bin}/jbang", "--init=cli", "hello.java"
      system "#{bin}/jbang", "hello.java", "Homebrew!"
  end
end
