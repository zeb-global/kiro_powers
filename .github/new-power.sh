#!/bin/bash

# Script to scaffold a new Kiro Power
# Usage: ./new-power.sh power-name "Display Name" "Description"

set -e

if [ $# -lt 3 ]; then
    echo "Usage: $0 <power-name> <Display Name> <Description>"
    echo "Example: $0 my-power \"My Power\" \"Does something cool\""
    exit 1
fi

POWER_NAME=$1
DISPLAY_NAME=$2
DESCRIPTION=$3
AUTHOR=${4:-"Your Name"}

echo "Creating new power: $POWER_NAME"
echo "================================"

# Create directory
mkdir -p "$POWER_NAME"
cd "$POWER_NAME"

# Create POWER.md
cat > POWER.md << EOF
---
name: "$POWER_NAME"
displayName: "$DISPLAY_NAME"
description: "$DESCRIPTION"
keywords: ["keyword1", "keyword2", "keyword3"]
author: "$AUTHOR"
---

# $DISPLAY_NAME

## Overview

[Describe what this power does and why it's useful]

## Prerequisites

Before using this power, you'll need:

1. [Prerequisite 1]
2. [Prerequisite 2]
3. [Prerequisite 3]

## Installation

[Step-by-step installation instructions]

## Common Workflows

### Workflow 1: [Name]

[Description and examples]

### Workflow 2: [Name]

[Description and examples]

## Configuration Options

[Available configuration options]

## Troubleshooting

### Issue: [Common Problem]

**Cause**: [Why it happens]

**Solution**: [How to fix]

## Best Practices

1. [Best practice 1]
2. [Best practice 2]
3. [Best practice 3]

## Resources

- [Link to documentation]
- [Link to source]
EOF

# Create README.md
cat > README.md << EOF
# $DISPLAY_NAME

$DESCRIPTION

## Quick Start

### Prerequisites

[List prerequisites]

### Installation

\`\`\`bash
# Installation steps
\`\`\`

## Key Features

- Feature 1
- Feature 2
- Feature 3

## Usage Examples

\`\`\`
Example command 1
\`\`\`

\`\`\`
Example command 2
\`\`\`

## Documentation

- **[POWER.md](POWER.md)**: Complete documentation
- **[INSTALLATION.md](INSTALLATION.md)**: Setup instructions
- **[QUICK_REFERENCE.md](QUICK_REFERENCE.md)**: Command examples

## Resources

- [External documentation]
- [Source repository]

## Version

**Current Version**: 1.0.0

## License

[License information]
EOF

# Create INSTALLATION.md
cat > INSTALLATION.md << EOF
# $DISPLAY_NAME Installation Guide

## Step-by-Step Installation

### 1. Prerequisites Check

Before installing, ensure you have:

- [ ] [Prerequisite 1]
- [ ] [Prerequisite 2]
- [ ] [Prerequisite 3]

### 2. [Setup Step]

[Instructions]

### 3. Install the Power

Choose one installation method:

#### Option A: User-Level Installation (Recommended)

\`\`\`bash
cp -r . ~/.kiro/powers/$POWER_NAME/
\`\`\`

#### Option B: Workspace-Level Installation

\`\`\`bash
cp -r . /path/to/workspace/.kiro/powers/$POWER_NAME/
\`\`\`

### 4. Verify Installation

[Verification steps]

## Configuration Options

[Configuration details]

## Troubleshooting

[Common issues and solutions]
EOF

# Create QUICK_REFERENCE.md
cat > QUICK_REFERENCE.md << EOF
# $DISPLAY_NAME Quick Reference

## Common Commands

\`\`\`
Command example 1
\`\`\`

\`\`\`
Command example 2
\`\`\`

## Tips and Tricks

1. [Tip 1]
2. [Tip 2]
3. [Tip 3]

## Common Patterns

[Useful patterns and examples]

## Resources

- [Link to documentation]
EOF

# Create CHANGELOG.md
cat > CHANGELOG.md << EOF
# Changelog

All notable changes to the $DISPLAY_NAME power will be documented in this file.

## [1.0.0] - $(date +%Y-%m-%d)

### Added
- Initial release of $DISPLAY_NAME power
- [Feature 1]
- [Feature 2]
- [Feature 3]

### Documentation
- Complete POWER.md documentation
- Installation guide
- Quick reference guide
EOF

echo ""
echo "✅ Power scaffolded successfully!"
echo ""
echo "Next steps:"
echo "1. Edit $POWER_NAME/POWER.md with your content"
echo "2. Create mcp.json if this is a Guided MCP Power"
echo "3. Fill in README.md, INSTALLATION.md, and QUICK_REFERENCE.md"
echo "4. Test your power locally"
echo "5. Update the root README.md"
echo "6. Submit a pull request"
echo ""
echo "See CONTRIBUTING.md for more details."
