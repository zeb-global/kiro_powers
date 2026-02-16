# Power Template

Use this template when creating new powers for this repository.

## Directory Structure

```
power-name/
├── POWER.md              # Required: Main documentation with frontmatter
├── mcp.json              # Required for Guided MCP Powers
├── README.md             # Recommended: Quick start guide
├── INSTALLATION.md       # Optional: Detailed setup instructions
├── QUICK_REFERENCE.md    # Optional: Command examples
└── steering/             # Optional: Dynamic content for complex powers
    ├── workflow-1.md
    └── workflow-2.md
```

## Required Files

### POWER.md

Must include frontmatter:

```yaml
---
name: "power-name"
displayName: "Human Readable Name"
description: "Clear description (max 3 sentences)"
keywords: ["keyword1", "keyword2", "keyword3"]
author: "Your Name"
---
```

Recommended sections:
- Overview
- Prerequisites
- Installation
- Common Workflows
- Tool Categories (if MCP power)
- Configuration Options
- Troubleshooting
- Best Practices

### mcp.json (for Guided MCP Powers)

```json
{
  "mcpServers": {
    "server-name": {
      "command": "docker",
      "args": ["run", "--rm", "-i", "image-name"],
      "env": {
        "ENV_VAR": "ENV_VAR_NAME"
      },
      "disabled": false,
      "autoApprove": []
    }
  }
}
```

## Optional Files

### README.md

Quick start guide with:
- Badges (version, status, license)
- Quick installation steps
- Key features
- Usage examples
- Links to detailed documentation

### INSTALLATION.md

Detailed setup with:
- Prerequisites checklist
- Step-by-step instructions
- Configuration options
- Troubleshooting
- Verification steps

### QUICK_REFERENCE.md

Command examples with:
- Common commands
- Code snippets
- Tips and tricks
- Keyboard shortcuts
- Error solutions

## Power Types

### Guided MCP Power
- Has `mcp.json` file
- Connects to MCP server
- Provides tools for execution

### Knowledge Base Power
- No `mcp.json` file
- Pure documentation
- Guides and best practices

## Checklist

Before submitting a new power:

- [ ] POWER.md with complete frontmatter
- [ ] mcp.json (if MCP power)
- [ ] README.md with quick start
- [ ] Installation instructions
- [ ] Usage examples
- [ ] Troubleshooting guide
- [ ] Tested installation process
- [ ] Updated root README.md
- [ ] Added to repository structure

## Naming Conventions

- **Directory**: `kebab-case` (e.g., `my-power`)
- **Display Name**: Title Case (e.g., "My Power")
- **Keywords**: lowercase, relevant terms
- **Files**: UPPERCASE.md for docs, lowercase for code

## Documentation Standards

- Use clear, concise language
- Include code examples
- Provide troubleshooting steps
- Link to external resources
- Keep context window in mind
- Follow Kiro voice and tone

## Testing

Include test commands or scripts:
- Pre-installation checks
- Post-installation verification
- Basic functionality tests
- Integration tests

## Resources

- [Kiro Powers Documentation](https://kiro.dev/docs/powers/)
- [Power Builder Guide](https://kiro.dev/docs/powers/building/)
- [MCP Configuration](https://kiro.dev/docs/mcp/configuration/)
