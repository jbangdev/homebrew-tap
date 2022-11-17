class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.100.1"
  url "https://github.com/jbangdev/jbang/releases/download/v0.100.1/jbang-0.100.1.zip"
  sha256 "a5b8f935f3aebe2901d9825cf32a6b9b3578493518d61aeb7b3a9f8df419be9c"
  license "MIT"


  def install
    libexec.install Dir["*"]
    inreplace "#{libexec}/bin/jbang", /^abs_jbang_dir=.*/, "abs_jbang_dir=#{libexec}/bin"
    bin.install_symlink "#{libexec}/bin/jbang"
  end

  test do
      system "#{bin}/jbang", "--init=cli", "hello.java"
      system "#{bin}/jbang", "hello.java", "Homebrew!"
  end
end
