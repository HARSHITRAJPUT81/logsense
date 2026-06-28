## ⚡ Install in One Command

Linux / macOS:
curl -fsSL https://raw.githubusercontent.com/HARSHITRAJPUT81/logsense/main/install.sh | bash

Windows (PowerShell as Administrator):
irm https://raw.githubusercontent.com/HARSHITRAJPUT81/logsense/main/install.ps1 | iex




# 🔍 LogSense AI

> AI-powered Linux log analyzer — detects errors, crashes and anomalies, then explains the root cause and suggests a fix using LLaMA AI.

![Python](https://img.shields.io/badge/Python-3.10+-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![AI](https://img.shields.io/badge/AI-Groq%20LLaMA-orange)
![Platform](https://img.shields.io/badge/Platform-Linux-yellow)

---

## 🚀 Install in One Command

\`\`\`bash
curl -fsSL https://raw.githubusercontent.com/HARSHITRAJPUT81/logsense/main/install.sh | bash
\`\`\`

> 💡 You need a **free Groq API key** from https://console.groq.com — the installer will ask for it automatically. No credit card needed.

---

## 💡 Why LogSense AI?

When something breaks on a Linux system, you normally have to manually search through thousands of log lines to find the problem. LogSense AI does this for you automatically — it finds the important lines, sends them to AI, and tells you exactly what went wrong and how to fix it.

---

## 🛠️ Commands

| Command | What it does |
|---|---|
| logsense analyze /var/log/syslog | Scan system log for all issues |
| logsense analyze /var/log/syslog --min-severity 80 | Show only errors and above |
| logsense watch /var/log/syslog | Monitor logs live in real time |
| logsense report | View history of all past analyses |

---

## 🔒 Security

- Path traversal attack prevention
- Maximum file size limit (50MB)
- Sensitive data masked before sending to AI
- API key stored locally in .env file — never shared

---

## 🏗️ Project Structure

logsense/
├── logsense/
│   ├── cli.py           # Commands: analyze / watch / report
│   ├── log_parser.py    # Detects errors by severity
│   ├── ai_analyzer.py   # Groq + LLaMA AI integration
│   ├── storage.py       # Saves history to SQLite
│   ├── security.py      # Input validation and data masking
│   └── config.py        # Loads environment variables
├── install.sh           # One-command installer
├── requirements.txt
└── .env.example

---

## 🔧 Tech Stack

| Tool | Purpose |
|---|---|
| Python 3.10+ | Core language |
| Typer | CLI framework |
| Rich | Terminal UI colors and tables |
| Groq + LLaMA | Free AI inference |
| SQLite | Local history storage |
| python-dotenv | Secure API key management |

---

## 🗺️ Roadmap

- Filter logs by time with --since 1h flag
- Support JSON structured logs
- Slack and Discord notifications
- Natural language log search
- Export reports to PDF

---

## 📄 License

MIT 2026 Harshit Rajput

---

## 👨‍💻 Author

Harshit Rajput
GitHub: https://github.com/HARSHITRAJPUT81
Project: https://github.com/HARSHITRAJPUT81/logsense

Star this repo if you found it useful!
