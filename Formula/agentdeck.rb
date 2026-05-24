class Agentdeck < Formula
  desc "Wrap decks from any source into enhanced single-file HTML presentations"
  homepage "https://github.com/shenyangs/agentdeck"
  url "https://github.com/shenyangs/agentdeck/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "94cb4728cd19ed72bf9f79580e45ec4cbb4a9463ac68250ac218d5cb7b67cabd"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(prefix: false)
    system "npm", "run", "build"

    libexec.install Dir["*"]
    bin.write_exec_script libexec/"packages/cli/dist/index.js"
  end

  test do
    output = shell_output("#{bin}/agentdeck --help")
    assert_match "AgentDeck", output
  end
end
