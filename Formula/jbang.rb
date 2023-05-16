class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.107.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.107.0/jbang-0.107.0.zip"
  sha256 "d295864c2ec0810e72dc3894ca6bc4559d2184e210d3659a4e59ce1513d504c6"
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
