class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.124.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.124.0/jbang-0.124.0.zip"
  sha256 "0b9957ad86ef59d33f248044e1b4bdc6a878426beb2819bcc0850fa4807453ac"
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
