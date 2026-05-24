class Agentdeck < Formula
  desc "Markdown-first HTML presentation toolchain for people and AI agents"
  homepage "https://github.com/shenyangs/agentdeck"
  url "https://github.com/shenyangs/agentdeck/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "b8809772ea703e090f8b33991f5ae4758416bece9d818b4a2519aa640f205d15"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install"
    system "npm", "run", "build"

    libexec.install Dir["*"]
    bin.write_exec_script libexec/"packages/cli/dist/index.js"
  end

  test do
    output = shell_output("#{bin}/agentdeck --help")
    assert_match "AgentDeck", output
  end
end
