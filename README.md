# AgentDeck

[English README](./README.en.md)

AgentDeck 是一个面向人类和 AI Agent 的 Markdown 优先 HTML 演示工具链。

它的核心定位可以收口成一句话：

**用一个 `deck.md` 生成一个可传播、可演示、可导出的单文件 HTML 演示稿。**

## 它适合做什么

- 用 Markdown 写演示稿
- 生成单文件 HTML
- 在浏览器里直接演示
- 导出 PDF、PNG、长图、九宫格、社媒图包
- 让 Agent 在稳定约束下生成可用 slides

## 安装

### 从 GitHub 拉取

```bash
git clone https://github.com/shenyangs/agentdeck.git
cd agentdeck
npm install
npm run build
```

### 用 Homebrew 安装

```bash
brew tap shenyangs/agentdeck
brew install agentdeck
```

Homebrew tap 仓库：

```text
https://github.com/shenyangs/homebrew-agentdeck
```

## 快速开始

```bash
npm run agentdeck -- init examples/demo --theme swiss
npm run agentdeck -- lint examples/demo/deck.md
npm run agentdeck -- build examples/demo/deck.md --single-html --mode audience --out examples/demo/dist
open examples/demo/dist/index.html
```

## CLI 命令

```bash
agentdeck init my-deck --theme swiss
agentdeck lint my-deck/deck.md
agentdeck classify my-deck/deck.md
agentdeck adapt my-deck/deck.md --scenario launch-campaign --out my-deck/deck.md
agentdeck build my-deck/deck.md --single-html --mode audience --out my-deck/dist
agentdeck export my-deck/deck.md --pdf --png --long-image --grid9 --social-pack --out my-deck/export
agentdeck compat swiss-locked path/to/index.html
agentdeck import-swiss-locked path/to/index.html --out deck.md
```

## `deck.md` 示例

```md
---
title: AI 内容生产协作平台
subtitle: 一个 Markdown 源文件生成一个可传播 HTML
theme: swiss
outputs: [html, pdf, png, long-image, grid9]
mode: audience
compatibility: swiss-locked
---

# AI 内容生产协作平台
layout: cover

团队已经有很多 AI 工具，但缺少一个能把策略、内容、视觉和交付物统一管理的生产协议。

# 核心判断
layout: statement

内容团队不是缺少生成能力，而是缺少可复盘、可审查、可交付的协作流程。
```

## 单文件 HTML 自带什么能力

生成出来的 audience HTML 自带完整演示能力：

- 上一页 / 下一页
- 重播
- 自动播放
- 自动播放时长切换
- 进度条与拖动跳页
- 缩略总览
- 下一页小预览
- Blank 屏
- Spotlight
- 全屏
- 浏览器打印 / PDF

常用快捷键：

- `ArrowLeft` / `ArrowRight`
- `O` 打开总览
- `C` 打开下一页预览
- `B` Blank 屏
- `L` Spotlight
- `P` 自动播放
- `F` 全屏
- `Esc` 关闭当前浮层

## 给 Agent 怎么用

推荐工作流：

1. 先明确 brief、受众、时长、证据要求
2. 先写 outline
3. 再写 `deck.md`
4. 运行 `agentdeck lint`
5. 运行 `agentdeck build`
6. 在浏览器里看总览、下一页预览和导出结果
7. 再修正文案密度、图片槽位、排版问题

## 兼容能力

兼容层现在是中性 profile，不再挂在别人的品牌名下：

- profile 名：`swiss-locked`
- package：`@agentdeck/compat-profiles`
- CLI：
  - `agentdeck compat swiss-locked ...`
  - `agentdeck import-swiss-locked ...`

这样既能兼容锁定式 Swiss HTML，又不会把 AgentDeck 做成某个工具的附庸。

## 仓库结构

- `packages/schema`：DSL 解析、类型、校验、场景重排
- `packages/themes`：主题 token 与 layout manifest
- `packages/runtime`：HTML runtime 和静态渲染器
- `packages/cli`：`agentdeck` 命令行
- `packages/compat-profiles`：兼容校验与导入
- `packages/skill`：Agent 使用说明
- `examples/`：公开示例

## 示例

- 基础 demo：
  - `examples/demo/deck.md`
- 场景画廊：
  - `examples/scenarios/`

## 开发

```bash
npm install
npm run build
npm test
npm run verify
```

构建一个 deck：

```bash
npm run agentdeck -- build examples/demo/deck.md --mode audience --profile swiss-locked --out examples/demo/dist
```

## 当前状态

当前公开版本已经具备：

- Markdown -> 单文件 HTML
- audience 播放控制
- 图片与导出链路
- Swiss locked 兼容 profile
- Homebrew 安装链路

下一层重点会是继续打磨播放器细节、Agent 生成体验和导出质量。
