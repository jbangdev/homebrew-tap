class Jbang < Formula
    desc "Unleash the power of Java"
    homepage "https://jbang.dev"
    url "https://github.com/jbangdev/jbang/releases/download/v0.69.2/jbang-0.69.2.zip"
    sha256 "cf3c03a1027196c2145724f7781a24ff57aa79d5ad7f98acaff134864e1d2b1d"

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