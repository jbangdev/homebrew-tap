class Jbang < Formula
    desc "Unleash the power of Java"
    homepage "https://jbang.dev"
    url "https://github.com/jbangdev/jbang/releases/download/v0.63.0/jbang-0.63.0.zip"
    sha256 "07b52b96fdae1ec76e7d00f218ac1caf86ba0b20b5bbd410fcd2629f0eedce5d"

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