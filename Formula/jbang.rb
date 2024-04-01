class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.116.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.116.0/jbang-0.116.0.zip"
  sha256 "66ecce7021c371d1fe1b01e4bd6ee01aaaa48b10925f7c36bed635b3d1150d2d"
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
