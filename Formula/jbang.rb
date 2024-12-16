class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.122.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.122.0/jbang-0.122.0.zip"
  sha256 "2decdc489a9dd1aed9046ed617e038c1558ccfa5c98b5db5fc81ef157da3f9e2"
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
