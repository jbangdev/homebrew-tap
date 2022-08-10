class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.97.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.97.0/jbang-0.97.0.zip"
  sha256 "0ca2c5f074f5cc8ada0143a3a93c588f1527753f1c7dfb55bffb05a6a084d68b"
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
