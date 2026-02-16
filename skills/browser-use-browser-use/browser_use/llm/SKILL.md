---
name: llm
description: Multi-provider LLM integration. Unified interface for OpenAI, Anthropic, Google, and local models.
metadata: {"clawdbot":{"emoji":"🔮","always":true,"requires":{"bins":["curl","jq"]}}}
---

# LLM 🔮

Multi-provider Large Language Model integration.

## Model Failover Chain (Cross-Provider Degradation)

When the primary model returns 503 or is unavailable, degrade in this exact order:

1. **codex/gpt-5.3-codex** ← PRIMARY
2. **codex/gpt-5.3-codex**
3. **codex/gpt-5.2-codex**
4. **codex/gpt-5-codex**
5. **google/gemini-2.5-pro**
6. **google/gemini-2.5-flash**
7. **moonshotai/kimi-k2.5**

**IMPORTANT**: Do NOT modify models.json or auth-profiles.json.

## Available Models (via https://claude.chiddns.com)

### GPT-5 Codex Series
- gpt-5.3-codex
- gpt-5.2-codex
- gpt-5.1-codex (primary)
- gpt-5-codex

### Google Gemini
- gemini-2.5-pro
- gemini-2.5-flash

### Moonshotai
- kimi-k2.5

## Usage

- Switch models with `/model <name>`
