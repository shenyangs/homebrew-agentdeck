class Agentdeck < Formula
  desc "Single-file HTML presentation player for AI-generated decks"
  homepage "https://github.com/shenyangs/agentdeck"
  url "https://github.com/shenyangs/agentdeck/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "b45743130acb7a5e93357af9938dd9cb34bf630101038690d1d21c75828e9c1e"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(prefix: false)
    system "npm", "run", "build"

    libexec.install Dir["*"]
    (bin/"agentdeck").write <<~SHELL
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/packages/cli/dist/index.js" "$@"
    SHELL
  end

  test do
    assert_match "AgentDeck", shell_output("#{bin}/agentdeck --help")

    (testpath/"deck.md").write <<~MARKDOWN
      ---
      title: Test Deck
      theme: swiss
      ---

      # Hello
      layout: statement

      AgentDeck is ready.
    MARKDOWN

    system bin/"agentdeck", "lint", testpath/"deck.md"
  end
end
