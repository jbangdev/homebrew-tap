class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.92.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.92.0/jbang-0.92.0.zip"
  sha256 "abe009387b95dad5895bd1fc8178b09f2963de6539a5f949cd9ae36f5d718c4b"
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
