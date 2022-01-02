class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.86.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.86.0/jbang-0.86.0.zip"
  sha256 "fd691c3d77152290e9f6072dfaa3acf1b582462a4eaf461cc149d2d027008dd1"
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
