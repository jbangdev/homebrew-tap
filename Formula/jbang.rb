class Jbang < Formula
    desc "Unleash the power of Java for shell scripting"
    homepage "https://jbang.dev"
    url "https://github.com/jbangdev/jbang/releases/download/v0.38.0/jbang-0.38.0.zip"
    sha256 "3501555533050f6efd615ffa1a6a112b3bb2bb075edf0dee92b33899b0875835"

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