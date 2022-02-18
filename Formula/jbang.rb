class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.90.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.90.0/jbang-0.90.0.zip"
  sha256 "a26de159fbcba263134217598c2f5e4b44b1b8ad337644dcc2564d9e65228213"
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
