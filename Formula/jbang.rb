class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.135.1"
  url "https://github.com/jbangdev/jbang/releases/download/v0.135.1/jbang-0.135.1.zip"
  sha256 "ca08772133ef712c1c115d228662fa69a3c693a2a8d521d6f5205f2b3a3f9616"
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
