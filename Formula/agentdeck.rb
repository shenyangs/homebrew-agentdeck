class Agentdeck < Formula
  desc "Markdown-first HTML presentation toolchain for people and AI agents"
  homepage "https://github.com/shenyangs/agentdeck"
  url "https://github.com/shenyangs/agentdeck/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "dc7144b04c92ce3fb948d8f43e871ccc2621360354a40332278b5dfb87d37cfb"
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
