class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.94.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.94.0/jbang-0.94.0.zip"
  sha256 "82b119409d4d49df1c15d459f857b32569a68fa38a8bcf1e95d9cd3372aae8c8"
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
