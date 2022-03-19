class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.92.1"
  url "https://github.com/jbangdev/jbang/releases/download/v0.92.1/jbang-0.92.1.zip"
  sha256 "a204a81b8b79b81b8daa318c22e2fad124abfce6351d316ea569945d54fd7f58"
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
