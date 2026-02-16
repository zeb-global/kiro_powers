# Changelog

All notable changes to the Grafana Kiro Power will be documented in this file.

## [1.0.0] - 2026-02-16

### Added
- Initial release of Grafana Kiro Power
- Comprehensive POWER.md documentation covering all features
- MCP server configuration using Docker image
- Support for Grafana 9.0+ and Grafana Cloud
- Complete tool coverage:
  - Dashboard operations (search, get, update, patch, summary)
  - Datasource management (Prometheus, Loki, ClickHouse, Pyroscope)
  - Prometheus querying (metrics, metadata, histograms)
  - Loki log querying (logs, patterns, statistics)
  - Alert management (rules, contact points)
  - Incident management (create, list, update)
  - OnCall operations (schedules, shifts, alert groups)
  - Sift investigations (error patterns, slow requests)
  - Navigation (deeplink generation)
  - Annotations (create, update, query)
  - Rendering (dashboard and panel image export)
  - Admin operations (teams, users, roles, permissions)
- Installation guide with step-by-step instructions
- Quick reference guide with common commands and examples
- README with configuration options
- Support for:
  - Multi-organization access
  - Custom HTTP headers
  - Debug mode
  - Read-only mode
  - TLS configuration
  - RBAC permissions

### Documentation
- Detailed POWER.md with:
  - Overview and key capabilities
  - Prerequisites and installation
  - Common workflows
  - Tool categories
  - RBAC permissions guide
  - Configuration options
  - Context window management
  - Troubleshooting
  - Best practices
- INSTALLATION.md with setup instructions
- QUICK_REFERENCE.md with command examples
- README.md with quick start guide

### Configuration
- Docker-based MCP server configuration
- Environment variable support for:
  - GRAFANA_URL
  - GRAFANA_SERVICE_ACCOUNT_TOKEN
  - GRAFANA_ORG_ID (optional)
  - GRAFANA_EXTRA_HEADERS (optional)
- Configurable tool categories
- Optional debug and read-only modes

## Future Enhancements

Potential additions for future versions:
- Steering files for specific workflows (if needed)
- Additional examples for complex use cases
- Integration guides for specific Grafana plugins
- Advanced RBAC configuration templates
- Grafana Cloud-specific optimizations

---

## Version Format

This project follows [Semantic Versioning](https://semver.org/):
- MAJOR version for incompatible changes
- MINOR version for new functionality
- PATCH version for bug fixes

## Links

- [Grafana MCP Server](https://github.com/grafana/mcp-grafana)
- [Kiro Documentation](https://kiro.dev/docs/)
- [Grafana Documentation](https://grafana.com/docs/)
