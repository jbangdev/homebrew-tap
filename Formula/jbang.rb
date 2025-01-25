class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.123.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.123.0/jbang-0.123.0.zip"
  sha256 "f77e3c1962c321bb68b62c105e6c06a59a0fbc7a1ca32274c15a6ca2466242db"
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
