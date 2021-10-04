class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.81.1"
  url "https://github.com/jbangdev/jbang/releases/download/v0.81.1/jbang-0.81.1.zip"
  sha256 "8d3d6e1a1862828e72c4f3304305d145e719dd689520dbc93f5e627e2aa72c04"
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