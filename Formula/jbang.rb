class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.126.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.126.0/jbang-0.126.0.zip"
  sha256 "0a9b63d37582e1826b5ed5f93f835cdc5e5b2701bf265149657d2ee3e195a8ff"
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
