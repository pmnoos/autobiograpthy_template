#!/bin/bash

echo ""
echo "==============================================="
echo " AUTOBIOGRAPHY TEMPLATE SETUP (Mac/Linux)"
echo "==============================================="
echo ""
echo "This script will set up your autobiography website."
echo ""

# Check if Ruby is installed
if ! command -v ruby &> /dev/null; then
    echo "❌ ERROR: Ruby is not installed"
    echo ""
    echo "Please install Ruby first:"
    echo "• macOS: Install Xcode Command Line Tools, then use rbenv or rvm"
    echo "• Linux: Use your package manager (e.g., apt install ruby-dev)"
    echo ""
    exit 1
fi

echo "✅ Ruby is installed ($(ruby --version))"
echo ""

# Check if we're in the right directory
if [ ! -f "Gemfile" ]; then
    echo "❌ ERROR: Gemfile not found"
    echo "Please run this script from the autobiography_template folder"
    echo ""
    exit 1
fi

echo "✅ Found project files"
echo ""

# Make sure the script is executable
chmod +x setup_wizard.rb

# Run the Ruby setup wizard
echo "Starting setup wizard..."
echo ""
ruby setup_wizard.rb

if [ $? -ne 0 ]; then
    echo ""
    echo "Setup encountered errors. Please check the messages above."
    exit 1
fi

echo ""
echo "==============================================="
echo " SETUP COMPLETE!"
echo "==============================================="
echo ""
echo "Your autobiography website is ready!"
echo ""
echo "To start the server:"
echo "  rails server"
echo ""
echo "Then visit: http://localhost:3000"
echo ""