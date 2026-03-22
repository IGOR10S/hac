# Host Availability Check (HAC)

A lightweight Batch script to quickly verify the availability of multiple IP addresses or hostnames from a file.

## Requirements

- Operating System: Microsoft Windows
- Interpreter: `cmd.exe` (Command Prompt)
- A `.txt` file containing **one IP address or hostname per line**

## Features

- Multi-host availability check
- Supports both IP addresses and hostnames
- 2-second timeout per host
- Clean console output
- Automatic report generation (`hac_report.txt`)
- Progressive host counter

## Description

The script:

1. Validates that an input file is provided
2. Checks whether the file exists
3. Reads each line (one host per line)
4. Sends one `ping` request (`-n 1`) with a 2000ms timeout (`-w 2000`)
5. Prints the result to the console
6. Saves results into `hac_report.txt`

This tool is ideal for:

- Network diagnostics
- Quick LAN/WAN reachability checks
- Basic server monitoring
- IT troubleshooting tasks
- Testing in LAN environments

## Project Structure

```text
hac/
├── hac.bat
├── hosts.txt
└── hac_report.txt (generated)
```

## Example

Create a file (e.g., `hosts.txt`)

```text
8.8.8.8
google.com
192.168.1.1
```

Run the script

```bash
.\hac.bat .\hosts.txt
```

Console output

```text
[1] Pinging 8.8.8.8 ...
    REACHABLE

[2] Pinging google.com ...
    REACHABLE

[3] Pinging 192.168.1.1 ...
    UNREACHABLE
```

Generated report (`hac_report.txt`)

```text
Ping results:
REACHABLE - 8.8.8.8
REACHABLE - google.com
UNREACHABLE - 192.168.1.1
```
