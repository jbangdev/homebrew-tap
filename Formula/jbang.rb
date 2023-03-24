class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.105.2"
  url "https://github.com/jbangdev/jbang/releases/download/v0.105.2/jbang-0.105.2.zip"
  sha256 "7b5ce3f8cc9c7aae422f2a5a18fc27af005b36c767ae48abe9ede232d5b8eaf3"
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
