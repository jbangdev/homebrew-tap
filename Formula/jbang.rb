class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.99.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.99.0/jbang-0.99.0.zip"
  sha256 "d3cdb4ca3db741d3b1f268d1e4fa5fae9228e3153a14af22d152aca70adaa547"
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
