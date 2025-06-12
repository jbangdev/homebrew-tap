class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.126.3"
  url "https://github.com/jbangdev/jbang/releases/download/v0.126.3/jbang-0.126.3.zip"
  sha256 "c45ac143bc92f4b9d3d35742a4852db95cf8a25765a0aa4d705b236ae346c066"
  license "MIT"


  def install
    libexec.install Dir["*"]
    inreplace "#{libexec}/bin/jbang", /^abs_jbang_dir=.*/, "abs_jbang_dir=#{libexec}/bin"
    bin.install_symlink "#{libexec}/bin/jbang"
  end

  test do
      system "#{bin}/jbang", "init", "-t", "cli", "hello.java"
      system "#{bin}/jbang", "hello.java", "Homebrew!"
  end
end
