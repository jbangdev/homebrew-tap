class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.89.1"
  url "https://github.com/jbangdev/jbang/releases/download/v0.89.1/jbang-0.89.1.zip"
  sha256 "f9cdd53ac7e9529a0a0c3463f3d3a16c63be30da1fc3819cc8822ec51d745bd7"
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
