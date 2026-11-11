# Deployment Documentation

## Deployment Steps

1. Connect to Linux server.
2. Check server health.
3. Verify disk and memory.
4. Check application services.
5. Deploy the application.
6. Verify application availability.

## Troubleshooting

Check service status:

systemctl status nginx

Check logs:

journalctl -u nginx
