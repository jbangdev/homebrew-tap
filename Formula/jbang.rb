class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.77.0"
  url "https://github.com/jbangdev/jbang/archive/v0.78.0.tar.gz"
  sha256 "1cb2773c1c18ded4aa2716dd239e78683db0e4d43aca0e6d4cbec5947197bc3f"
  license "MIT"

  bottle :unneeded


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