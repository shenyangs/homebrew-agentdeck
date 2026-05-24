class Agentdeck < Formula
  desc "Wrap decks from any source into enhanced single-file HTML presentations"
  homepage "https://github.com/shenyangs/agentdeck"
  url "https://github.com/shenyangs/agentdeck/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "c240daef1fe8de909c08e2ab7b8e520684d1db9b2759d73b5d8f3219a393550e"
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
