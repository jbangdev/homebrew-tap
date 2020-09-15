class Jbang < Formula
    desc "Unleash the power of Java for shell scripting"
    homepage "https://jbang.dev"
    url "https://github.com/jbangdev/jbang/releases/download/v0.45.0/jbang-0.45.0.zip"
    sha256 "ba6bcb91765f5d41df7862d34013ce9691f5dd84717a7ced9bd63e2dcd83719b"

#    bottle :unneeded

#    keg_only :versioned_formula

    #depends_on cask:"java"
 #   depends_on :java => "1.8+"

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