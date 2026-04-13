class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.138.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.138.0/jbang-0.138.0.zip"
  sha256 "3c9fb9ac5823ae5ab9d136dec08b896e2a0f6f6b313689b21f43c511b7c34b85"
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
