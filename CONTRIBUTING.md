# Contributing to Kiro Powers Collection

Thank you for your interest in contributing! This guide will help you add new powers to the collection.

## Getting Started

1. **Fork the repository**
2. **Create a new branch** for your power: `git checkout -b power/your-power-name`
3. **Follow the power template** in `.github/POWER_TEMPLATE.md`
4. **Test thoroughly** before submitting
5. **Submit a pull request**

## Adding a New Power

### Step 1: Create Power Directory

```bash
mkdir your-power-name
cd your-power-name
```

### Step 2: Create Required Files

**POWER.md** (required):
```yaml
---
name: "your-power-name"
displayName: "Your Power Name"
description: "Clear description of what your power does"
keywords: ["keyword1", "keyword2", "keyword3"]
author: "Your Name"
---

# Your Power Name

## Overview
[Description of your power]

## Prerequisites
[What users need before installation]

## Installation
[How to install]

## Common Workflows
[How to use the power]

## Troubleshooting
[Common issues and solutions]
```

**mcp.json** (if MCP power):
```json
{
  "mcpServers": {
    "your-server": {
      "command": "command-to-run",
      "args": ["arg1", "arg2"],
      "env": {
        "ENV_VAR": "ENV_VAR_NAME"
      }
    }
  }
}
```

**README.md** (recommended):
- Quick start guide
- Key features
- Installation steps
- Usage examples

### Step 3: Add Documentation

Create supporting documentation:
- `INSTALLATION.md` - Detailed setup instructions
- `QUICK_REFERENCE.md` - Command examples
- `TEST_COMMANDS.md` - Verification tests
- `CHANGELOG.md` - Version history

### Step 4: Test Your Power

1. Install locally:
```bash
cp -r your-power-name ~/.kiro/powers/
```

2. Test in Kiro:
   - Activate the power
   - Try basic commands
   - Verify all tools work
   - Check error handling

3. Run verification tests (if provided)

### Step 5: Update Repository

Update the root `README.md`:

```markdown
### Your Power Name
Brief description of what it does.

**Status**: ✅ Ready  
**Type**: Guided MCP Power / Knowledge Base Power  
**Documentation**: [your-power-name/README.md](your-power-name/README.md)
```

### Step 6: Submit Pull Request

1. Commit your changes:
```bash
git add .
git commit -m "Add [Your Power Name] power"
```

2. Push to your fork:
```bash
git push origin power/your-power-name
```

3. Create a pull request with:
   - Clear title: "Add [Your Power Name] power"
   - Description of what the power does
   - Installation instructions
   - Testing notes

## Power Quality Standards

### Documentation
- [ ] Clear and concise writing
- [ ] Complete installation instructions
- [ ] Usage examples included
- [ ] Troubleshooting section
- [ ] Links to external resources

### Code Quality
- [ ] mcp.json follows standard format
- [ ] Environment variables documented
- [ ] Error handling considered
- [ ] Security best practices followed

### Testing
- [ ] Tested locally
- [ ] Installation verified
- [ ] All tools functional
- [ ] Error cases handled

### User Experience
- [ ] Easy to install
- [ ] Clear prerequisites
- [ ] Good error messages
- [ ] Helpful examples

## Power Types

### Guided MCP Power
Powers that connect to MCP servers:
- Must include `mcp.json`
- Document all tools
- Provide usage examples
- Include RBAC/permissions info

### Knowledge Base Power
Powers with pure documentation:
- No `mcp.json` needed
- Focus on guides and best practices
- Include workflows
- Provide references

## Documentation Style

Follow the Kiro voice:
- Knowledgeable but not instructive
- Speak like a dev when needed
- Decisive, precise, and clear
- Supportive, not authoritative
- Warm and friendly
- Easygoing, not mellow

## File Naming

- **Directories**: `kebab-case`
- **Documentation**: `UPPERCASE.md`
- **Code/Config**: `lowercase.json`
- **Display Names**: Title Case

## Common Mistakes to Avoid

1. ❌ Missing frontmatter in POWER.md
2. ❌ Incomplete installation instructions
3. ❌ No usage examples
4. ❌ Untested power
5. ❌ Missing prerequisites
6. ❌ No troubleshooting section
7. ❌ Forgetting to update root README.md

## Review Process

Pull requests will be reviewed for:
1. **Completeness**: All required files present
2. **Quality**: Documentation is clear and helpful
3. **Testing**: Power works as described
4. **Standards**: Follows repository conventions
5. **Value**: Provides useful functionality

## Getting Help

- Check `.github/POWER_TEMPLATE.md` for structure
- Look at existing powers (e.g., `grafana/`) for examples
- Review [Kiro Powers documentation](https://kiro.dev/docs/powers/)
- Ask questions in pull request comments

## Code of Conduct

- Be respectful and constructive
- Help others learn and improve
- Focus on making great powers
- Share knowledge and best practices

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.

## Questions?

Open an issue or ask in your pull request!

Thank you for contributing! 🎉
