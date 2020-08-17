class Jbang < Formula
    desc "Unleash the power of Java for shell scripting"
    homepage "https://jbang.dev"
    url "https://github.com/jbangdev/jbang/releases/download/v0.37.0/jbang-0.37.0.zip"
    sha256 "c5f3e490533a8381f7ac2b2be5b0c23e5d377d3d5bfe23b963184c54b62370f3"

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