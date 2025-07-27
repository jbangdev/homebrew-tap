class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.128.2"
  url "https://github.com/jbangdev/jbang/releases/download/v0.128.2/jbang-0.128.2.zip"
  sha256 "47e4001aaea8f7f4a6281d0864fa707c7b67d0bfbb042a142770cdd7449c7f41"
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
