class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.83.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.83.0/jbang-0.83.0.zip"
  sha256 "31023e92c6ffe0b6599d8a0d2239f18165e0c5653689350a7b3a7d97092c842b"
  license "MIT"


  def install
    libexec.install Dir["*"]
    inreplace "#{libexec}/bin/jbang", /^abs_jbang_dir=.*/, "abs_jbang_dir=#{libexec}/bin/jbang.jar"
    bin.install_symlink "#{libexec}/bin/jbang"
  end

  test do
      system "#{bin}/jbang", "--init=cli", "hello.java"
      system "#{bin}/jbang", "hello.java", "Homebrew!"
  end
end