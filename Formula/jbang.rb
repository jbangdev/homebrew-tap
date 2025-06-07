class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.126.2"
  url "https://github.com/jbangdev/jbang/releases/download/v0.126.2/jbang-0.126.2.zip"
  sha256 "abf2a4341b13612d093bec4a6564a5b54bc1e3ba4805c8e40e521347a6f7f73b"
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
