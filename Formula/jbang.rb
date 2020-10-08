class Jbang < Formula
    desc "Unleash the power of Java for shell scripting"
    homepage "https://jbang.dev"
    url "https://github.com/jbangdev/jbang/releases/download/v0.50.0/jbang-0.50.0.zip"
    sha256 "634dadd2bee21735263ef30d9a174331e9e8902b1d76423be2d01a6ec24101fe"

    bottle :unneeded

    keg_only :versioned_formula

    #depends_on cask:"java"
    depends_on :java => "1.8+"

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