class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.106.1"
  url "https://github.com/jbangdev/jbang/releases/download/v0.106.1/jbang-0.106.1.zip"
  sha256 "8950ecb093776ec23e53ce27554a8d47223ea995e6a1b4b44b3cddf27c06de1d"
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
