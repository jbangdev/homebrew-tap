class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.111.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.111.0/jbang-0.111.0.zip"
  sha256 "651cd36b02a704745eaf1bb6c04dab1596fa13a178dae6c2db427bbbeb9e3d86"
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
