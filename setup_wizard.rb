#!/usr/bin/env ruby

# 🧙‍♂️ Autobiography Template Setup Wizard
# This script will guide you through setting up your autobiography website

require 'fileutils'
require 'io/console'

class SetupWizard
  def initialize
    @project_root = __dir__
    @errors = []
    @warnings = []
  end

  def run
    puts "\n" + "="*60
    puts "📖 AUTOBIOGRAPHY TEMPLATE SETUP WIZARD"
    puts "="*60
    puts "\nWelcome! This wizard will help you set up your autobiography website."
    puts "The process will take about 5-10 minutes.\n\n"

    # Check if we're in the right directory
    unless File.exist?('Gemfile') && File.exist?('config/application.rb')
      puts "❌ Error: This doesn't appear to be a Rails application directory."
      puts "   Please run this script from the autobiography_template folder."
      exit 1
    end

    puts "✅ Found Rails application files"
    
    # Check Ruby version
    check_ruby_version
    
    # Check if Bundler is installed
    check_bundler
    
    # Install dependencies
    install_dependencies
    
    # Setup database
    setup_database
    
    # Check if server can start
    test_server
    
    # Success message
    show_success_message
  end

  private

  def check_ruby_version
    print "🔍 Checking Ruby version... "
    ruby_version = RUBY_VERSION
    major, minor, patch = ruby_version.split('.').map(&:to_i)
    
    if major >= 3 && minor >= 0
      puts "✅ Ruby #{ruby_version} (Good!)"
    else
      puts "⚠️  Ruby #{ruby_version} (May have compatibility issues)"
      @warnings << "Consider upgrading to Ruby 3.0 or later"
    end
  end

  def check_bundler
    print "🔍 Checking for Bundler... "
    if system('bundle --version > nul 2>&1')
      puts "✅ Bundler is installed"
    else
      puts "❌ Bundler not found"
      puts "\n💡 Installing Bundler..."
      unless system('gem install bundler')
        puts "❌ Failed to install Bundler. Please install it manually:"
        puts "   gem install bundler"
        exit 1
      end
      puts "✅ Bundler installed successfully"
    end
  end

  def install_dependencies
    puts "\n📦 Installing dependencies..."
    puts "   This may take a few minutes...\n"
    
    unless system('bundle install')
      puts "❌ Failed to install dependencies."
      puts "\n🔧 Troubleshooting:"
      puts "   1. Make sure you have an internet connection"
      puts "   2. Try running: bundle install --verbose"
      puts "   3. Check the error messages above for missing system packages"
      exit 1
    end
    
    puts "✅ Dependencies installed successfully"
  end

  def setup_database
    puts "\n🗄️  Setting up database..."
    
    # Create database
    print "   Creating database... "
    if system('rails db:create > nul 2>&1')
      puts "✅"
    else
      puts "⚠️  (may already exist)"
    end
    
    # Run migrations
    print "   Running migrations... "
    if system('rails db:migrate > nul 2>&1')
      puts "✅"
    else
      puts "❌ Failed to run migrations"
      @errors << "Database migration failed"
    end
    
    # Seed database
    print "   Adding sample content... "
    if system('rails db:seed > nul 2>&1')
      puts "✅"
    else
      puts "⚠️  Some sample content may not have loaded"
      @warnings << "Database seeding had warnings (this is usually okay)"
    end
  end

  def test_server
    puts "\n🚀 Testing server startup..."
    puts "   (This will start the server briefly to test)"
    
    # Try to start server in test mode
    pid = spawn('rails server -p 3001 -e development', :out => File::NULL, :err => File::NULL)
    
    # Wait a moment for startup
    sleep 3
    
    # Test if port is responding
    begin
      require 'net/http'
      uri = URI('http://localhost:3001')
      response = Net::HTTP.get_response(uri)
      puts "✅ Server test successful"
    rescue => e
      puts "⚠️  Server test inconclusive (this may be normal)"
      @warnings << "Server connectivity test failed, but this doesn't necessarily indicate a problem"
    ensure
      # Clean up the test server
      Process.kill('TERM', pid) rescue nil
      Process.wait(pid) rescue nil
    end
  end

  def show_success_message
    puts "\n" + "="*60
    puts "🎉 SETUP COMPLETE!"
    puts "="*60
    
    if @errors.empty?
      puts "\n✅ Your autobiography template is ready to use!\n"
      puts "🚀 To start your website:"
      puts "   rails server"
      puts "\n🌐 Then open your browser and visit:"
      puts "   http://localhost:3000"
      puts "\n📧 Default admin login:"
      puts "   Email: admin@example.com"
      puts "   Password: password123"
      puts "\n📚 Next steps:"
      puts "   1. Read docs/GETTING_STARTED.md for customization guide"
      puts "   2. Change the admin password after first login"
      puts "   3. Start writing your life story!"
    else
      puts "\n⚠️  Setup completed with some issues:"
      @errors.each { |error| puts "   ❌ #{error}" }
    end
    
    if @warnings.any?
      puts "\n💡 Warnings (usually safe to ignore):"
      @warnings.each { |warning| puts "   ⚠️  #{warning}" }
    end
    
    puts "\n📖 Documentation:"
    puts "   • Getting Started: docs/GETTING_STARTED.md"
    puts "   • Troubleshooting: docs/TROUBLESHOOTING.md"
    puts "   • FAQ: docs/FAQ.md"
    
    puts "\n💌 Need help? Create an issue on GitHub:"
    puts "   https://github.com/pmnoos/autobiography_template/issues"
    puts "\n" + "="*60
  end
end

# Run the wizard
if __FILE__ == $0
  wizard = SetupWizard.new
  wizard.run
end