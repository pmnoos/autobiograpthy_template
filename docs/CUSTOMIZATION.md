# 🎨 Customization Guide

This guide will help you customize the Autobiography Template with your own content, branding, and styling.

## 🖼️ Adding Your Profile Photo

1. **Prepare your photo**
   - Recommended size: 400x400 pixels or larger (square)
   - Format: JPG, PNG, or WebP
   - Keep file size under 500KB for best performance

2. **Add your photo**
   - Save your photo as `public/your-profile-photo.jpg`
   - The template will automatically use this image in the navigation, footer, and about page
   - If the file is missing, it will show a nice user icon placeholder

## ✏️ Updating Text Content

### Site Title and Branding

Edit `app/views/layouts/application.html.erb`:

```erb
<!-- Change the site title -->
<title><%= content_for(:title) || "Your Site Title" %></title>

<!-- Update navigation branding -->
<span class="text-xl font-bold text-gray-900">Your Name's Autobiography</span>

<!-- Update footer branding -->
<span class="text-xl font-semibold text-gray-900">Your Name's Life Story</span>
```

### About Page

Edit `app/views/pages/about.html.erb`:

1. **Update the main heading**
2. **Replace placeholder text with your personal story**
3. **Modify the "What You'll Find Here" section**

### Home Page

Edit the chapters controller and views to customize:
- Welcome message
- Featured chapters
- Personal introduction

## 🎨 Styling and Colors

### Changing Colors

The template uses Tailwind CSS. Common color combinations to update:

```erb
<!-- Primary colors (currently blue) -->
bg-blue-600 hover:bg-blue-500
text-blue-600

<!-- Accent colors (currently purple gradient) -->
from-purple-400 to-blue-500
```

### Custom CSS

Add custom styles in `app/assets/stylesheets/application.css`:

```css
/* Your custom styles */
.custom-header {
  /* Your styles here */
}
```

## 📝 Content Management

### Adding Chapters

1. **Login to admin area** with your credentials
2. **Click "New Chapter"** in the navigation (when logged in)
3. **Fill in the chapter details:**
   - Title: The chapter name
   - Subtitle: A brief description
   - Content: Your story (supports rich text)
   - Header Image: Optional chapter image

### Adding Photos

1. **Login to admin area**
2. **Navigate to Gallery** and click "Add Photo"
3. **Upload your photo** and add:
   - Title: Photo caption
   - Description: Story behind the photo
   - Date taken: When the photo was taken

### Managing Content

- **Edit existing content** by clicking on chapters or photos when logged in
- **Delete content** using the delete buttons in the admin interface
- **Reorder chapters** by updating their creation dates

## 🔧 Advanced Customization

### Adding New Pages

1. **Create the route** in `config/routes.rb`:
   ```ruby
   get '/my-new-page', to: 'pages#my_new_page'
   ```

2. **Add the action** in `app/controllers/pages_controller.rb`:
   ```ruby
   def my_new_page
   end
   ```

3. **Create the view** `app/views/pages/my_new_page.html.erb`

### Customizing the Database

To add new fields to chapters or photos:

1. **Generate a migration**:
   ```bash
   rails generate migration AddFieldToChapters field_name:string
   ```

2. **Run the migration**:
   ```bash
   rails db:migrate
   ```

3. **Update the model and views** to use the new field

### Email Configuration

Configure email settings in `config/environments/production.rb` for contact forms:

```ruby
config.action_mailer.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 587,
  domain: 'yourdomain.com',
  user_name: 'your-email@gmail.com',
  password: 'your-app-password',
  authentication: 'plain',
  enable_starttls_auto: true
}
```

## 🚀 Going Live

### Deployment Options

1. **Heroku** (easiest)
2. **DigitalOcean**
3. **AWS**
4. **Your own server**

### Before Deploying

1. **Update database configuration** for production
2. **Set environment variables** for secrets
3. **Configure file storage** (AWS S3, etc.)
4. **Set up SSL certificate**
5. **Configure domain name**

### Security Checklist

- [ ] Change default admin password
- [ ] Set strong secret keys
- [ ] Enable SSL/HTTPS
- [ ] Configure firewall
- [ ] Set up regular backups

## 🛠️ Troubleshooting

### Common Issues

**Images not showing:**
- Check file paths and permissions
- Ensure images are in the `public/` directory

**Styling issues:**
- Clear browser cache
- Check Tailwind CSS classes
- Verify asset pipeline compilation

**Database errors:**
- Run `rails db:migrate`
- Check database configuration
- Verify seed data

## 📞 Need Help?

If you need assistance with customization:
1. Check the Rails documentation
2. Refer to Tailwind CSS documentation
3. Contact support if you purchased this template

---

**Remember:** Always backup your data before making major changes!
