# 🛠️ Troubleshooting Guide

Common issues and solutions for your autobiography website.

---

## 🚨 **Setup & Installation Issues**

### "Command not found" or "Ruby not found"
**Problem:** Terminal says ruby, rails, or bundle commands don't exist

**Solutions:**
- Install Ruby from [rubyinstaller.org](https://rubyinstaller.org/)
- Install Rails: `gem install rails`
- Restart terminal after installation
- Check PATH environment variables

### "Permission denied" errors
**Problem:** Can't write files or install gems

**Solutions:**
- **Windows:** Run terminal as Administrator
- **Mac/Linux:** Use `sudo` carefully or fix gem permissions
- **Alternative:** Use rbenv or rvm for Ruby management

### "Bundle install fails"
**Problem:** Gem installation errors

**Solutions:**
```bash
# Clear gem cache
bundle clean --force

# Update bundler
gem update bundler

# Try again
bundle install
```

---

## 🗄️ **Database Issues**

### "Database locked" or "SQLite busy"
**Problem:** Can't modify database while server is running

**Solutions:**
1. Stop server (Ctrl+C)
2. Run database commands
3. Restart server

### "No such table" errors
**Problem:** Database tables don't exist

**Solutions:**
```bash
rails db:create
rails db:migrate
rails db:seed
```

### "Empty chapters" or "No sample content"
**Problem:** Chapters exist but have no content

**Solutions:**
```bash
# Use our chapter population script
ruby populate_chapters.rb

# OR reset database completely
rails db:reset
```

---

## 🔐 **Authentication Problems**

### "Can't log in" with default credentials
**Problem:** Email/password doesn't work

**Solutions:**
1. Verify you're using: `admin@example.com` / `password123`
2. Check caps lock is off
3. Clear browser cache
4. Try incognito/private browser window
5. Reset password in Rails console:
```bash
rails console
user = User.first
user.update(password: "newpassword")
```

### "Session expired" messages
**Problem:** Getting logged out frequently

**Solutions:**
- Clear browser cookies
- Restart browser
- Check system clock is correct

---

## 🌐 **Server & Loading Issues**

### "Port 3000 already in use"
**Problem:** Can't start server on default port

**Solutions:**
```bash
# Use different port
rails server -p 3001

# OR find and kill process using port 3000
lsof -ti:3000 | xargs kill -9  # Mac/Linux
netstat -ano | findstr :3000   # Windows
```

### "Page not loading" or "Site unreachable"
**Problem:** Browser can't connect to localhost

**Solutions:**
1. Check server is actually running
2. Try `127.0.0.1:3000` instead of `localhost:3000`
3. Check firewall settings
4. Restart server

### "Assets not loading" or "CSS broken"
**Problem:** Site loads but styling is missing

**Solutions:**
```bash
# Precompile assets
rails assets:precompile

# Clear asset cache
rails assets:clobber

# Restart server
```

---

## 📝 **Content & Editing Issues**

### "Rich text editor not working"
**Problem:** Can't format text or add images

**Solutions:**
1. Clear browser cache
2. Try different browser
3. Check JavaScript is enabled
4. Disable browser extensions

### "Photos won't upload"
**Problem:** Image upload fails

**Solutions:**
- Check file size (under 5MB recommended)
- Use JPG, PNG, or GIF format
- Check file permissions
- Ensure storage directory exists

### "Content not saving"
**Problem:** Edits disappear after saving

**Solutions:**
1. Check internet connection
2. Clear browser cache
3. Try shorter content first
4. Check database permissions

---

## 🎨 **Styling & Design Issues**

### "Tailwind CSS not working"
**Problem:** Custom styles not applying

**Solutions:**
- Check syntax in CSS files
- Restart server after CSS changes
- Clear browser cache
- Verify file paths are correct

### "Mobile version looks broken"
**Problem:** Site doesn't work on phones

**Solutions:**
- Clear mobile browser cache
- Check viewport meta tag exists
- Test on different mobile browsers

---

## 🚀 **Deployment Issues**

### "Heroku deployment fails"
**Problem:** Can't deploy to hosting service

**Solutions:**
1. Check all files are committed to Git
2. Verify Procfile exists
3. Set environment variables correctly
4. Check logs for specific errors

### "Database doesn't migrate on production"
**Problem:** Live site missing database tables

**Solutions:**
```bash
# Heroku example
heroku run rails db:migrate
heroku run rails db:seed
```

---

## 💻 **Browser-Specific Issues**

### Internet Explorer / Old Edge
**Problem:** Site doesn't work in old browsers

**Solution:** Use modern browsers (Chrome, Firefox, Safari, new Edge)

### Safari on iPhone
**Problem:** Strange behavior on iOS

**Solutions:**
- Clear Safari cache
- Check Private Browsing is off
- Update iOS to latest version

---

## 🔍 **Debugging Tips**

### Check Error Messages
**Where to look:**
1. **Browser console** (F12 → Console tab)
2. **Rails server output** in terminal
3. **Log files** in `log/development.log`

### Common Error Patterns
- **500 errors:** Server-side Ruby/Rails issues
- **404 errors:** Page/route doesn't exist
- **ActionController errors:** Controller/routing problems
- **ActiveRecord errors:** Database issues

### Getting Help
1. **Copy full error message** (don't paraphrase)
2. **Note what you were doing** when error occurred
3. **Check if reproducible** in fresh browser window
4. **Search online** for exact error message

---

## 📞 **When to Get Professional Help**

Consider hiring a developer if:
- [ ] Multiple setup attempts fail
- [ ] You need custom features beyond template
- [ ] Database is corrupted and can't be recovered
- [ ] Security concerns arise
- [ ] You want advanced hosting setup

---

## 💡 **Prevention Tips**

- **Regular backups** of your content
- **Test changes** in development before deploying
- **Keep dependencies updated** but test first
- **Use version control** (Git) for tracking changes
- **Document customizations** you make

---

## 🆘 **Emergency Recovery**

### If everything breaks:
1. **Stop server** (Ctrl+C)
2. **Backup current content** if possible
3. **Re-download fresh template**
4. **Copy your content** to new template
5. **Start over with setup**

### Database corruption:
```bash
# Nuclear option - lose all content
rails db:drop db:create db:migrate db:seed

# Better option - export content first
rails console
# Copy chapter content to text files
```

---

**Remember:** Most issues have simple solutions. Don't panic, take your time, and work through problems systematically. Your story is worth the effort! 📖✨
