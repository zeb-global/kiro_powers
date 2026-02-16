# Grafana Kiro Power

[![Grafana](https://img.shields.io/badge/Grafana-9.0+-orange)](https://grafana.com)
[![Docker](https://img.shields.io/badge/Docker-Required-blue)](https://docker.com)
[![License](https://img.shields.io/badge/License-Apache%202.0-green)](https://github.com/grafana/mcp-grafana)

A comprehensive Kiro Power for interacting with Grafana instances through the Model Context Protocol (MCP).

## Quick Start

### Prerequisites

1. **Docker**: Ensure Docker is installed and running
2. **Grafana Instance**: Either local Grafana (9.0+) or Grafana Cloud
3. **Service Account Token**: Create a service account in Grafana with appropriate permissions

### Installation

1. **Set up environment variables**:

```bash
export GRAFANA_URL="http://localhost:3000"  # Or your Grafana Cloud URL
export GRAFANA_SERVICE_ACCOUNT_TOKEN="your-token-here"
```

2. **Pull the Docker image**:

```bash
docker pull grafana/mcp-grafana
```

3. **Install the power**:

```bash
# For user-level installation
cp -r . ~/.kiro/powers/grafana/

# Or for workspace-level installation
cp -r . /path/to/your/workspace/.kiro/powers/grafana/
```

4. **Activate the power** in Kiro and start using Grafana tools!

## What's Included

- **POWER.md**: Comprehensive documentation for using Grafana with Kiro
- **mcp.json**: MCP server configuration for the Grafana Docker image
- **SUMMARY.md**: Quick overview of capabilities and use cases
- **INSTALLATION.md**: Detailed step-by-step setup instructions
- **QUICK_REFERENCE.md**: Command examples and cheat sheets
- **TEST_COMMANDS.md**: Testing and verification guide
- **CHANGELOG.md**: Version history
- **PROJECT_OVERVIEW.md**: Complete project documentation

## Key Features

- **Dashboard Management**: Search, view, modify, and create dashboards
- **Metrics Querying**: Execute PromQL queries against Prometheus
- **Log Analysis**: Query logs with LogQL from Loki datasources
- **Alert Management**: Create and manage alert rules and notifications
- **Incident Response**: Track and manage incidents in Grafana Incident
- **OnCall Integration**: Manage schedules and on-call rotations
- **Sift Investigations**: Automated error pattern and slow request detection
- **Deeplink Generation**: Create accurate URLs to Grafana resources
- **Image Rendering**: Export dashboards and panels as PNG images

## Usage Examples

### Query Prometheus Metrics

```
List my Prometheus datasources, then query CPU usage for the last hour
```

### Search Dashboards

```
Find all dashboards related to Kubernetes
```

### Create an Incident

```
Create a new incident for the API latency spike we're seeing
```

### Generate Dashboard Links

```
Generate a deeplink to the monitoring dashboard with the last 6 hours of data
```

## Documentation

- **[POWER.md](POWER.md)**: Complete feature documentation and usage guide
- **[INSTALLATION.md](INSTALLATION.md)**: Detailed installation instructions
- **[QUICK_REFERENCE.md](QUICK_REFERENCE.md)**: Command examples and cheat sheets
- **[TEST_COMMANDS.md](TEST_COMMANDS.md)**: Testing and verification guide
- **[SUMMARY.md](SUMMARY.md)**: Quick overview of capabilities
- **[CHANGELOG.md](CHANGELOG.md)**: Version history
- **[PROJECT_OVERVIEW.md](PROJECT_OVERVIEW.md)**: Complete project documentation

## Configuration Options

### Debug Mode

Enable detailed logging by adding `--debug` to the args in `mcp.json`

### Read-Only Mode

Prevent write operations by adding `--disable-write`

### Enable Additional Tools

Add categories to `--enabled-tools` (e.g., `admin,clickhouse`)

### Multi-Organization Support

Set `GRAFANA_ORG_ID` environment variable

## Troubleshooting

### Docker Connection Issues

**Error**: `spawn mcp-grafana ENOENT`

**Solution**: Ensure Docker is running and the image is pulled:
```bash
docker pull grafana/mcp-grafana
```

### Authentication Errors

**Error**: `401 Unauthorized`

**Solution**: Verify your service account token is correct and not expired

### Permission Errors

**Error**: `403 Forbidden`

**Solution**: Ensure your service account has the Editor role or appropriate RBAC permissions

See [INSTALLATION.md](INSTALLATION.md) for more troubleshooting help.

## Resources

- [Grafana MCP Server GitHub](https://github.com/grafana/mcp-grafana)
- [Grafana Documentation](https://grafana.com/docs/)
- [Kiro Powers Documentation](https://kiro.dev/docs/powers/)
- [PromQL Documentation](https://prometheus.io/docs/prometheus/latest/querying/basics/)
- [LogQL Documentation](https://grafana.com/docs/loki/latest/logql/)

## Version

**Current Version**: 1.0.0  
**Last Updated**: February 16, 2026

## License

This power configuration is provided as-is. The Grafana MCP server is licensed under Apache License 2.0 by Grafana Labs.
