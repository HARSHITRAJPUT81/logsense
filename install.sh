#!/bin/bash

echo ""
echo "🔍 LogSense AI Installer"
echo "========================"

# Check Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 not found. Installing..."
    sudo apt install python3 python3-pip python3-venv -y
fi

# Setup venv
echo "📦 Setting up environment..."
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt -q
pip install -e . -q

# API Key setup
echo ""
echo "🔑 You need a FREE Groq API key (takes 1 minute)"
echo "   1. Go to: https://console.groq.com"
echo "   2. Sign up with Google"
echo "   3. Click API Keys → Create API Key"
echo "   4. Copy the key (starts with gsk_...)"
echo ""
read -p "Paste your Groq API key here: " api_key

cat > .env << ENVEOF
GROQ_API_KEY=$api_key
LOGSENSE_MODEL=claude-sonnet-4-6
LOGSENSE_DB=~/.logsense/history.db
ENVEOF

# Add to PATH permanently
INSTALL_DIR="$(pwd)"
echo "export PATH=\"$INSTALL_DIR/venv/bin:\$PATH\"" >> ~/.bashrc
source ~/.bashrc

echo ""
echo "✅ LogSense AI installed successfully!"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📌 Available commands:"
echo ""
echo "  Analyze your system log:"
echo "  → sudo logsense analyze /var/log/syslog"
echo ""
echo "  Analyze only critical errors:"
echo "  → sudo logsense analyze /var/log/syslog --min-severity 80"
echo ""
echo "  Watch live logs:"
echo "  → sudo logsense watch /var/log/syslog"
echo ""
echo "  See analysis history:"
echo "  → logsense report"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
