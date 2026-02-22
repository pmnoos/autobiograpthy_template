# Autobiography Template Seeds
# This file creates sample content to demonstrate the autobiography template functionality.
# Replace this sample content with your own stories and experiences.

puts "🌱 Setting up your autobiography template..."
puts ""

# Create default admin user for testing/demo
puts "👤 Creating default admin user..."
admin_user = User.find_or_create_by(email_address: "admin@example.com") do |user|
  user.password = "password123"
  user.password_confirmation = "password123"
end

puts "✅ Admin user ready:"
puts "   📧 Email: #{admin_user.email_address}"
puts "   🔐 Password: password123"
puts "   ⚠️  IMPORTANT: Change this password after first login!"
puts ""

# Clear existing sample data
puts "🧹 Cleaning existing sample data..."
Chapter.destroy_all
puts "   ✅ Sample chapters cleared"
puts ""

# Load content helper for generating sample content
require Rails.root.join('app', 'helpers', 'content_helper.rb')

# Create comprehensive sample chapters using the content helper
puts "📚 Creating sample chapters with writing templates..."

sample_content = ContentHelper.generate_sample_content("[Your Name]")

sample_content[:chapters].each_with_index do |chapter_data, index|
  chapter = Chapter.create!(
    title: chapter_data[:title],
    content: chapter_data[:content]
  )
  
  puts "   ✅ Created: #{chapter.title}"
end

puts ""
puts "📝 Sample chapters created with writing templates and prompts!"
puts "   These chapters include detailed writing prompts to help you get started."
puts "   Each chapter provides specific questions and ideas for your own content."
puts ""

# Create sample homepage content file
puts "🏠 Setting up homepage content..."
homepage_content = sample_content[:homepage_intro]
File.write('tmp/homepage_content.txt', homepage_content)
puts "   ✅ Homepage template content ready"
puts ""

# Create sample about page content file  
puts "👋 Setting up about page content..."
about_content = sample_content[:about_page]
File.write('tmp/about_content.txt', about_content)
puts "   ✅ About page template content ready"
puts ""

# Display setup completion message
puts "🎉 " + "="*60
puts "🎉 AUTOBIOGRAPHY TEMPLATE SETUP COMPLETE!"
puts "🎉 " + "="*60
puts ""
puts "🚀 Next Steps:"
puts "   1. Start your server: rails server"
puts "   2. Visit: http://localhost:3000"
puts "   3. Login with the credentials above"
puts "   4. Replace sample content with your own stories"
puts ""
puts "📖 Documentation:"
puts "   • docs/GETTING_STARTED.md - Complete setup guide"
puts "   • docs/QUICK_START.md - Quick start instructions"
puts "   • docs/STORY_PLANNING_TEMPLATE.md - Writing prompts and ideas"
puts "   • docs/CUSTOMIZATION.md - Styling and customization"
puts ""
puts "💡 Writing Tips:"
puts "   • Start with one chapter at a time"
puts "   • Use the writing prompts in each sample chapter"
puts "   • Add photos to make your stories more engaging"
puts "   • Don't worry about perfection - you can always edit later"
puts ""
puts "✨ Your story matters! Start sharing it with the world."
puts "="*68
