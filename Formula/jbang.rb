class Jbang < Formula
    desc "Unleash the power of Java for shell scripting"
    homepage "https://github.com/maxandersen/jbang"
    url "https://github.com/maxandersen/jbang/releases/download/v0.24.0/jbang-0.24.0.zip"
    sha256 "24a4007bd82e3d2b04b2e94516e67e6868a7f577b37b0f55e14ecd549f4e25aa"

    bottle :unneeded

    keg_only :versioned_formula

    #depends_on cask:"java"
    depends_on :java => "1.8+"

    def install
      libexec.install Dir["*"]
      inreplace "#{libexec}/bin/jbang", /^jarPath=.*/, "jarPath=#{libexec}/bin/jbang.jar"
      bin.install_symlink "#{libexec}/bin/jbang"
    end

    test do
        system "#{bin}/jbang", "--init=cli", "hello.java"
        system "#{bin}/jbang", "hello.java", "Homebrew!"
    end
  end