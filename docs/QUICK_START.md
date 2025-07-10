# ⚡ Quick Start Guide

Get your autobiography website up and running in under 10 minutes!

---

## 📋 **Prerequisites**

Before you begin, make sure you have:
- [ ] **Ruby 3.0+** installed ([Download here](https://rubyinstaller.org/))
- [ ] **Rails 7.0+** installed (`gem install rails`)
- [ ] **Git** installed ([Download here](https://git-scm.com/))
- [ ] A **text editor** (VS Code recommended)

**Check your versions:**
```bash
ruby --version
rails --version
git --version
```

---

## 🚀 **Option 1: One-Click Setup (Recommended)**

### Windows Users:
```bash
setup.bat
```

### Mac/Linux Users:
```bash
./setup.sh
```

**That's it!** The script will:
- Install all dependencies
- Set up the database
- Load sample content
- Start the server

---

## 🔧 **Option 2: Manual Setup**

If you prefer to run commands manually:

### 1. Install Dependencies
```bash
bundle install
```

### 2. Setup Database
```bash
rails db:create
rails db:migrate
rails db:seed
```

### 3. Start Server
```bash
rails server
```

### 4. Open Your Site
Visit: **http://localhost:3000**

---

## 🔐 **First Login**

Use these default credentials:
- **Email:** `admin@example.com`
- **Password:** `password123`

**⚠️ IMPORTANT:** Change this password immediately after logging in!

---

## ✅ **Verify Everything Works**

After setup, you should see:
- [ ] Homepage with sample content
- [ ] Navigation menu working
- [ ] 5 sample chapters with writing prompts
- [ ] Login/logout functionality
- [ ] Admin interface accessible

---

## 🎨 **First Customizations**

### 1. Change Site Title
Edit: `app/views/chapters/index.html.erb`
```erb
<h1>Your Name's Life Story</h1>
```

### 2. Add Your Profile Photo
Replace: `public/images/profile.jpg` with your photo (400x400px recommended)

### 3. Update About Page
Edit: `app/views/pages/about.html.erb` with your personal information

### 4. Replace Sample Chapters
1. Login to admin interface
2. Go to "Chapters"
3. Edit each chapter with your own stories

---

## 🌐 **Next Steps**

1. **📖 Read the [Getting Started Guide](GETTING_STARTED.md)** for detailed instructions
2. **✍️ Use the [Story Planning Template](STORY_PLANNING_TEMPLATE.md)** to organize your thoughts
3. **🎨 Check the [Customization Guide](CUSTOMIZATION.md)** for styling options
4. **🚀 See the [Deployment Guide](DEPLOYMENT_GUIDE.md)** when ready to go live

---

## 🆘 **Having Issues?**

### Common Problems:
- **Server won't start?** Check Ruby/Rails installation
- **Can't login?** Use `admin@example.com` / `password123`
- **Missing chapters?** Run `rails db:seed` again
- **Styling broken?** Run `rails assets:precompile`

**More help:** Check the [Troubleshooting Guide](TROUBLESHOOTING.md)

---

## 💡 **Pro Tips**

- **Start small**: Edit one sample chapter first to get familiar
- **Use writing prompts**: Each sample chapter has helpful questions
- **Add photos**: Makes your stories more engaging
- **Backup regularly**: Export your content as you write
- **Mobile-friendly**: Your site works perfectly on phones/tablets

---

**🎉 You're ready to start sharing your story! Remember: every great autobiography begins with a single memory.**
