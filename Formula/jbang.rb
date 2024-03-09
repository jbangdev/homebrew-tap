class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.115.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.115.0/jbang-0.115.0.zip"
  sha256 "51cbeee30e0c9d2ec50085777f4adc93eed77f2dfde0be37075926718b9bc0e5"
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
