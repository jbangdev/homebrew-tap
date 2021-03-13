class Jbang < Formula
    desc "Unleash the power of Java"
    homepage "https://jbang.dev"
    url "https://github.com/jbangdev/jbang/releases/download/v0.67.2/jbang-0.67.2.zip"
    sha256 "20fd2208dbe1867a8b11c5e77db55de9e1c9f928714efddf140efa7258a3a165"

    bottle :unneeded

    #depends_on cask:"java"
    #depends_on :java => "1.8+"

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