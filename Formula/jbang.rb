class Jbang < Formula
    desc "Unleash the power of Java"
    homepage "https://jbang.dev"
    url "https://github.com/jbangdev/jbang/releases/download/v0.61.0/jbang-0.61.0.zip"
    sha256 "a881e92ffee1533a08fa6a36cd5ecdd05d8e67d4ff376235cb5560ddc3e178ba"

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