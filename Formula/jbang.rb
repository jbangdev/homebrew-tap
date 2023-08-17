class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.110.1"
  url "https://github.com/jbangdev/jbang/releases/download/v0.110.1/jbang-0.110.1.zip"
  sha256 "d81aacd8f15acc11590c6227b66a185f6c6384e3e18f5d08aaf6499ec2345c51"
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
