class Jbang < Formula
    desc "Unleash the power of Java for shell scripting"
    homepage "https://github.com/maxandersen/jbang"
    url "https://github.com/maxandersen/jbang/releases/download/v0.20.0/jbang-0.20.0.zip"
    sha256 "c40f1214ea8c9ff075f785c0cf43a509eabf8f77bf9b3026c29bfe69567020b9"

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