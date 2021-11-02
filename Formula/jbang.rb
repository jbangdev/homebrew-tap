class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.82.1"
  url "https://github.com/jbangdev/jbang/releases/download/v0.82.1/jbang-0.82.1.zip"
  sha256 "ae809bd5cbce14d492e6237c04039bcbd4e2833ecdce294e8205cc358135f5cc"
  license "MIT"


  def install
    libexec.install Dir["*"]
    inreplace "#{libexec}/bin/jbang", /^abs_jbang_dir=.*/, "abs_jbang_dir=#{libexec}/bin/jbang.jar"
    bin.install_symlink "#{libexec}/bin/jbang"
  end

  test do
      system "#{bin}/jbang", "--init=cli", "hello.java"
      system "#{bin}/jbang", "hello.java", "Homebrew!"
  end
end
