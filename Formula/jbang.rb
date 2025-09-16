class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.131.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.131.0/jbang-0.131.0.zip"
  sha256 "b4ea18e8aea0ae62b80932b650d6c87b276412a84a04ff9d25a70da5dedd76a3"
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
