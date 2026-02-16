# Kiro Powers Collection

A curated collection of production-ready Kiro Powers that extend your AI-assisted development workflow with specialized tools, integrations, and knowledge bases.

## What Are Kiro Powers?

Kiro Powers are packages that enhance Kiro's capabilities by providing:

- **MCP Server Integrations**: Connect to external tools and services through the Model Context Protocol
- **Specialized Knowledge**: Domain-specific guides, best practices, and workflows
- **Tool Documentation**: Comprehensive guides for CLI tools and platforms
- **Automation Workflows**: Pre-built patterns for common development tasks

Each power is self-contained, well-documented, and ready to install.

## Repository Goals

This collection aims to:

1. **Provide Production-Ready Powers**: Each power is thoroughly tested and documented
2. **Enable Quick Integration**: Install and start using powers in minutes
3. **Share Best Practices**: Learn from well-structured examples
4. **Build Community**: Contribute your own powers and help others
5. **Maintain Quality**: Follow consistent standards and documentation patterns

## Available Powers

### Grafana
Interact with Grafana dashboards, datasources, and observability data. Query Prometheus and Loki, manage incidents, alerts, and OnCall schedules.

**Status**: ✅ Ready  
**Type**: Guided MCP Power  
**Documentation**: [grafana/README.md](grafana/README.md)

## Why Use This Collection?

### For Developers
- **Save Time**: Pre-built integrations instead of starting from scratch
- **Learn Patterns**: See how to structure and document powers effectively
- **Stay Updated**: Powers maintained with latest best practices

### For Teams
- **Standardization**: Consistent power structure across your organization
- **Knowledge Sharing**: Document team-specific workflows as powers
- **Onboarding**: New team members get instant access to tools and guides

### For Contributors
- **Clear Guidelines**: Follow established patterns and templates
- **Easy Scaffolding**: Use provided scripts to create new powers
- **Community Impact**: Help others by sharing your integrations

## Quick Start

### Installing a Power

Each power has detailed installation instructions in its directory. General steps:

```bash
# 1. Navigate to the power directory
cd grafana/

# 2. Read the README for prerequisites
cat README.md

# 3. Install (user-level)
cp -r . ~/.kiro/powers/grafana/

# Or install (workspace-level)
cp -r . /path/to/workspace/.kiro/powers/grafana/
```

### Creating a New Power

Use the scaffolding script:

```bash
./.github/new-power.sh my-power "My Power" "Does something cool"
```

Or follow the template in `.github/POWER_TEMPLATE.md`

## Repository Structure

```
.
├── .github/                    # Repository tools and templates
│   ├── POWER_TEMPLATE.md      # Template for creating new powers
│   └── new-power.sh           # Scaffolding script for new powers
├── grafana/                    # Grafana observability power
│   ├── POWER.md               # Main documentation (required)
│   ├── mcp.json               # MCP configuration (required for MCP powers)
│   ├── README.md              # Quick start guide
│   └── ...                    # Additional documentation
├── [future-powers]/            # More powers coming soon
├── CONTRIBUTING.md             # Contribution guidelines
└── README.md                   # This file
```

## Power Types

### Guided MCP Powers
Powers that connect to MCP servers to provide executable tools:
- Include `mcp.json` configuration
- Provide access to external services
- Enable automation and integration
- Example: Grafana (query metrics, manage dashboards)

### Knowledge Base Powers
Powers that provide pure documentation and guidance:
- No `mcp.json` needed
- Focus on best practices and workflows
- Include guides and references
- Example: Testing strategies, security checklists

## Quality Standards

All powers in this collection follow these standards:

- ✅ **Complete Documentation**: POWER.md with frontmatter and comprehensive guides
- ✅ **Installation Instructions**: Clear, step-by-step setup process
- ✅ **Usage Examples**: Real-world command examples and workflows
- ✅ **Troubleshooting**: Common issues and solutions documented
- ✅ **Testing**: Verified to work as described
- ✅ **Maintenance**: Kept up-to-date with dependencies

## Contributing

We welcome contributions! Here's how to add a new power:

1. **Review Guidelines**: Read [CONTRIBUTING.md](CONTRIBUTING.md)
2. **Use Template**: Follow `.github/POWER_TEMPLATE.md` or use the scaffolding script
3. **Test Thoroughly**: Ensure your power works as documented
4. **Submit PR**: Include clear description and testing notes

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed instructions.

## Getting Help

- **Power-Specific Issues**: Check the power's documentation and troubleshooting section
- **General Questions**: Open an issue in this repository
- **Contribution Help**: See CONTRIBUTING.md or ask in your PR
- **Kiro Documentation**: Visit [kiro.dev/docs](https://kiro.dev/docs/)

## Roadmap

### Planned Powers
- AWS CLI and SDK integration
- Kubernetes management
- Terraform workflows
- GitHub operations
- Database tools (PostgreSQL, MySQL)
- Docker and container management

### Community Requests
Have an idea for a power? Open an issue with the "power-request" label!

## Philosophy

This collection follows these principles:

1. **Quality Over Quantity**: Each power is well-crafted and maintained
2. **User-Focused**: Documentation written for developers, by developers
3. **Self-Contained**: Each power includes everything needed to use it
4. **Community-Driven**: Open to contributions and feedback
5. **Best Practices**: Follow Kiro power-builder guidelines

## Resources

- [Kiro Documentation](https://kiro.dev/docs/)
- [Kiro Powers Guide](https://kiro.dev/docs/powers/)
- [Power Builder Documentation](https://kiro.dev/docs/powers/building/)
- [Model Context Protocol](https://modelcontextprotocol.io/)

## License

Each power may have its own license. See individual power directories for details.

---

**Maintained by the community** | **Contributions welcome** | **Built for developers**
