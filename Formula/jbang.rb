class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.123.0"
  url "https://github.com/jbangdev/jbang/archive/refs/tags/v0.124.0.tar.gz"
  sha256 "1f39aeea2505459dd4bd3f5e474c4f1eccaf6df08b5c665b14f2c59da17a0ccd"
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
