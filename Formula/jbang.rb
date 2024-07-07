class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.117.1"
  url "https://github.com/jbangdev/jbang/releases/download/v0.117.1/jbang-0.117.1.zip"
  sha256 "28b66273d5ff4057ed37a2dfda5b49b549768e8bed6e0ea335015eea8d28c67c"
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
