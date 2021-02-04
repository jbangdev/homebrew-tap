class Jbang < Formula
    desc "Unleash the power of Java"
    homepage "https://jbang.dev"
    url "https://github.com/jbangdev/jbang/releases/download/v0.64.0/jbang-0.64.0.zip"
    sha256 "55256eb1f531892f735cf4e93592f699cdf8739a9068ece2268fb1da494f7a69"

    bottle :unneeded

    #depends_on cask:"java"
    #depends_on :java => "1.8+"

    def install
      libexec.install Dir["*"]
      inreplace "#{libexec}/bin/jbang", /^abs_jbang_path=.*/, "abs_jbang_path=#{libexec}/bin/jbang.jar"
      bin.install_symlink "#{libexec}/bin/jbang"
    end

    test do
        system "#{bin}/jbang", "--init=cli", "hello.java"
        system "#{bin}/jbang", "hello.java", "Homebrew!"
    end
  end