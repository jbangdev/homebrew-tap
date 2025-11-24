class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.134.2"
  url "https://github.com/jbangdev/jbang/releases/download/v0.134.2/jbang-0.134.2.zip"
  sha256 "befee0b59a0e4087dc0c08402e97e35ace2e8b8409b96dd8348cc4cd5ead94f8"
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
