---
title: Linux Networking
sidebar_position: 3
---

# Linux Networking Guide

Useful commands for diagnosing network connectivity, DNS, routes and listening ports.

## View network interfaces

```bash
ip addr
```

Short form:

```bash
ip -br addr
```

## View routing information

```bash
ip route
```

## Check connectivity

```bash
ping -c 4 1.1.1.1
```

Test DNS resolution:

```bash
getent hosts example.com
```

## Check DNS configuration

```bash
cat /etc/resolv.conf
```

If available:

```bash
resolvectl status
```

## Test HTTP connectivity

```bash
curl -I https://example.com
```

## View listening ports

```bash
ss -tuln
```

Include process information:

```bash
sudo ss -tulnp
```

## Check a specific port

For port 3000:

```bash
ss -ltnp 'sport = :3000'
```

For port 8080:

```bash
ss -ltnp 'sport = :8080'
```

## Trace network routes

Install traceroute:

```bash
sudo apt install traceroute
```

Run:

```bash
traceroute example.com
```

## Troubleshoot DNS

Check name resolution:

```bash
getent hosts example.com
```

Compare with direct IP connectivity:

```bash
ping -c 4 1.1.1.1
```

A successful IP test but failed name resolution may indicate a DNS problem.

## WSL networking

WSL2 networking is managed partly by Windows.

View your WSL IP addresses:

```bash
hostname -I
```

Check the Linux default route:

```bash
ip route
```

WSL IP addresses and networking behavior can change after restarting WSL.

## Kubernetes networking

Check Services:

```bash
kubectl get svc -A
```

Check Ingress:

```bash
kubectl get ingress -A
```

Inspect a Service:

```bash
kubectl describe svc SERVICE_NAME -n NAMESPACE
```
EOF

