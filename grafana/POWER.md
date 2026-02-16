---
name: "grafana"
displayName: "Grafana"
description: "Interact with Grafana dashboards, datasources, and observability data. Query Prometheus and Loki, manage incidents, alerts, and OnCall schedules."
keywords: ["grafana", "observability", "monitoring", "prometheus", "loki", "dashboards", "alerts", "oncall", "metrics", "logs"]
author: "Grafana Labs"
---

# Grafana MCP Server

## Overview

The Grafana power provides comprehensive access to your Grafana instance and its ecosystem through the Model Context Protocol. Whether you're working with local Grafana or Grafana Cloud, this power enables you to query metrics and logs, manage dashboards and alerts, handle incidents, and interact with the full observability stack.

This power works with Grafana version 9.0 or later for full functionality.

## Key Capabilities

- **Dashboards**: Search, retrieve, modify, and create dashboards with context-aware operations
- **Datasources**: List and query Prometheus, Loki, ClickHouse, and Pyroscope datasources
- **Querying**: Execute PromQL and LogQL queries, retrieve metrics and logs
- **Alerting**: Manage alert rules and contact points
- **Incidents**: Create and track incidents in Grafana Incident
- **OnCall**: Manage schedules, shifts, and alert groups
- **Sift**: Investigate issues with automated pattern detection
- **Navigation**: Generate accurate deeplinks to Grafana resources
- **Rendering**: Export dashboard panels and full dashboards as PNG images

## Prerequisites

Before using this power, you'll need:

1. **Grafana Instance**: Either a local Grafana installation (9.0+) or Grafana Cloud account
2. **Service Account Token**: Create a service account in Grafana with appropriate permissions
   - Navigate to Administration → Service accounts in Grafana
   - Create a new service account
   - Assign the Editor role (for broad access) or configure fine-grained RBAC permissions
   - Generate a token and save it securely

For detailed RBAC configuration, see the [RBAC Permissions](#rbac-permissions) section below.

## Installation

The power is configured to use the Docker image, which is the recommended approach. The MCP server will be automatically started when you activate this power.

**Environment Variables Required:**
- `GRAFANA_URL`: Your Grafana instance URL (e.g., `http://localhost:3000` or `https://myinstance.grafana.net`)
- `GRAFANA_SERVICE_ACCOUNT_TOKEN`: Your service account token

**Optional Environment Variables:**
- `GRAFANA_ORG_ID`: Organization ID for multi-org support
- `GRAFANA_EXTRA_HEADERS`: JSON object with custom HTTP headers

## Common Workflows

### Working with Dashboards

**Search for dashboards:**
```
Use search_dashboards to find dashboards by title or metadata
```

**Get dashboard overview:**
```
Use get_dashboard_summary to see panel count, types, variables, and metadata
This is the recommended first step - it minimizes context window usage
```

**Extract specific dashboard data:**
```
Use get_dashboard_property with JSONPath expressions
Examples:
- $.title - Get dashboard title
- $.panels[*].title - Get all panel titles
- $.templating.list[*].name - Get all variable names
```

**Get panel queries:**
```
Use get_dashboard_panel_queries to see all panel queries and datasource info
```

**Modify dashboards:**
```
Use patch_dashboard for targeted changes (recommended - saves context window)
Use update_dashboard only when you need to replace the entire dashboard
```

### Querying Metrics and Logs

**Query Prometheus metrics:**
```
1. List datasources to find your Prometheus datasource UID
2. Use query_prometheus with PromQL queries
   - Supports instant queries and range queries
   - Can calculate histogram percentiles with query_prometheus_histogram
3. Explore metadata with list_prometheus_metric_names, list_prometheus_label_names
```

**Query Loki logs:**
```
1. List datasources to find your Loki datasource UID
2. Use query_loki_logs with LogQL queries
   - Supports both log queries and metric queries
3. Discover patterns with query_loki_patterns
4. Get stream statistics with query_loki_stats
```

**High-level log search:**
```
Use search_logs (requires --enabled-tools searchlogs flag)
Searches across ClickHouse (OTel format) and Loki datasources
```

### Managing Alerts

**List and view alerts:**
```
Use list_alert_rules to see all alert rules and their statuses
Use get_alert_rule_by_uid for detailed information about a specific rule
```

**Create or modify alerts:**
```
Use create_alert_rule to define new alert rules
Use update_alert_rule to modify existing rules
Use delete_alert_rule to remove rules
```

**Manage notifications:**
```
Use list_contact_points to see configured notification channels
```

### Incident Management

**Work with incidents:**
```
Use list_incidents to see all incidents
Use create_incident to create a new incident
Use add_activity_to_incident to add updates
Use get_incident to retrieve details by ID
```

### OnCall Management

**Manage schedules:**
```
Use list_oncall_schedules to see all schedules
Use get_current_oncall_users to find who's on call
Use get_oncall_shift for shift details
```

**Handle alert groups:**
```
Use list_alert_groups to view and filter alert groups
Use get_alert_group for detailed information
```

### Sift Investigations

**Automated issue detection:**
```
Use find_error_pattern_logs to detect elevated error patterns in Loki logs
Use find_slow_requests to identify slow requests in Tempo traces
Use list_sift_investigations to see all investigations
Use get_sift_investigation and get_sift_analysis for details
```

### Navigation and Sharing

**Generate deeplinks:**
```
Use generate_deeplink to create accurate URLs for:
- Dashboards (by UID)
- Specific panels (with viewPanel parameter)
- Explore views (with datasource configuration)
- Time ranges and custom parameters
```

### Rendering

**Export visualizations:**
```
Use get_panel_image to render dashboard panels or full dashboards as PNG
Customize dimensions, time range, theme, scale, and variables
Note: Requires Grafana Image Renderer service to be installed
```

## Tool Categories

The MCP server organizes tools into categories that can be enabled or disabled:

- **search**: Dashboard search operations
- **dashboard**: Dashboard management (read and write)
- **datasource**: Datasource listing and information
- **prometheus**: Prometheus querying and metadata
- **loki**: Loki log querying and metadata
- **clickhouse**: ClickHouse database operations (disabled by default)
- **alerting**: Alert rule and contact point management
- **incident**: Grafana Incident management
- **oncall**: Grafana OnCall operations
- **sift**: Sift investigation tools
- **pyroscope**: Pyroscope profiling operations
- **asserts**: Assertion management
- **navigation**: Deeplink generation
- **annotations**: Annotation management
- **rendering**: Dashboard and panel image export
- **admin**: Administrative operations (disabled by default)
- **examples**: Query examples (disabled by default)
- **searchlogs**: High-level log search (disabled by default)

## RBAC Permissions

Each tool requires specific RBAC permissions. When creating a service account, you can either:

1. **Simple approach**: Assign the built-in Editor role for broad read/write access
2. **Fine-grained approach**: Configure specific permissions and scopes

### Common Permission Patterns

**Full MCP server access:**
```
Permissions: datasources:read, datasources:query, dashboards:read, dashboards:create, 
             dashboards:write, teams:read, users:read, alert.rules:read, alert.rules:write
Scopes: datasources:*, dashboards:*, folders:*, teams:*, global.users:*
```

**Read-only access:**
```
Permissions: datasources:read, datasources:query, dashboards:read, alert.rules:read
Scopes: datasources:*, dashboards:*, folders:*
```

**Limited datasource access:**
```
Permissions: datasources:query
Scopes: datasources:uid:prometheus-prod, datasources:uid:loki-prod
```

For complete RBAC documentation, see the [Grafana RBAC documentation](https://grafana.com/docs/grafana/latest/administration/roles-and-permissions/).

## Configuration Options

### Read-Only Mode

Use the `--disable-write` flag to prevent any write operations:
```
This disables: update_dashboard, create_incident, create_alert_rule, 
               update_alert_rule, delete_alert_rule, and annotation writes
```

### Debug Mode

Enable detailed HTTP request/response logging:
```
Add --debug flag to the server configuration
```

### Multi-Organization Support

Specify which organization to interact with:
```
Set GRAFANA_ORG_ID environment variable to the numeric organization ID
Or use X-Grafana-Org-Id HTTP header (takes precedence)
```

### TLS Configuration

For Grafana instances behind mTLS or with custom certificates:
```
--tls-cert-file: Client certificate for authentication
--tls-key-file: Client private key
--tls-ca-file: CA certificate for server verification
--tls-skip-verify: Skip verification (insecure, testing only)
```

## Context Window Management

Dashboard operations can consume significant context window space. Follow these best practices:

1. **Start with summaries**: Use `get_dashboard_summary` for overview
2. **Extract specific data**: Use `get_dashboard_property` with JSONPath for targeted retrieval
3. **Avoid full JSON**: Only use `get_dashboard_by_uid` when absolutely necessary
4. **Use patch operations**: Prefer `patch_dashboard` over `update_dashboard` for modifications

## Troubleshooting

### Grafana Version Compatibility

**Error**: `get datasource by uid: [GET /datasources/uid/{uid}][400] getDataSourceByUidBadRequest`

**Cause**: Grafana version earlier than 9.0

**Solution**: Upgrade to Grafana 9.0 or later

### Authentication Issues

**Error**: `401 Unauthorized`

**Cause**: Invalid or expired service account token

**Solution**: 
1. Verify token is correct
2. Check service account still exists and is enabled
3. Regenerate token if necessary

### Permission Errors

**Error**: `403 Forbidden`

**Cause**: Insufficient RBAC permissions

**Solution**:
1. Review required permissions for the tool you're using
2. Assign Editor role for quick testing
3. Configure fine-grained permissions for production

### Docker Connection Issues

**Error**: `spawn mcp-grafana ENOENT`

**Cause**: Docker not available or incorrect configuration

**Solution**:
1. Verify Docker is installed and running
2. Check Docker image is pulled: `docker pull grafana/mcp-grafana`
3. Ensure `-t stdio` flag is included in Docker args

## Best Practices

1. **Use service accounts**: Never use personal user credentials
2. **Limit permissions**: Apply principle of least privilege with RBAC
3. **Enable only needed tools**: Disable unused categories to reduce context window
4. **Start with read operations**: Verify queries before making changes
5. **Use summaries first**: Minimize context usage with targeted queries
6. **Generate deeplinks**: Share accurate URLs instead of guessing
7. **Monitor context usage**: Be aware of large dashboard JSON payloads

## Additional Resources

- [Grafana Documentation](https://grafana.com/docs/)
- [Grafana RBAC Guide](https://grafana.com/docs/grafana/latest/administration/roles-and-permissions/)
- [Service Account Documentation](https://grafana.com/docs/grafana/latest/administration/service-accounts/)
- [MCP Grafana GitHub Repository](https://github.com/grafana/mcp-grafana)
- [PromQL Documentation](https://prometheus.io/docs/prometheus/latest/querying/basics/)
- [LogQL Documentation](https://grafana.com/docs/loki/latest/logql/)
