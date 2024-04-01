class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.115.0"
  url "https://github.com/jbangdev/jbang/archive/v0.116.0.tar.gz"
  sha256 "de953a134394e489a93d7a87b8b93286d6633ce6791eb668271fcb26813bf815"
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
