class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.91.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.91.0/jbang-0.91.0.zip"
  sha256 "2367aef3988e334becc9fd7b78fc80c5f3d427b148b1bf95ec327663b9658d3f"
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
