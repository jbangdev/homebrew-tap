class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.80.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.80.0/jbang-0.80.0.zip"
  sha256 "e8ce7832101d4a696859e30fc4a0ab5bf512bfe53662dbe8699979f6f050d9af"
  license "MIT"

  bottle :unneeded


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