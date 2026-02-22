# 🧙‍♂️ Setup Wizard

This step-by-step wizard will guide you through setting up M_C_Story from start to finish. Follow each step in order for the best experience.

## 📋 Pre-Setup Checklist

Before we begin, make sure you have:
- [ ] A computer running Windows, macOS, or Linux
- [ ] Administrator/admin rights on your computer
- [ ] Internet connection
- [ ] About 1 hour of uninterrupted time
- [ ] Your profile photo ready (optional, can be added later)

## 🎯 Setup Overview

We'll complete these phases:
1. **Environment Setup** - Install required software
2. **Template Installation** - Get M_C_Story running
3. **Initial Customization** - Add your basic information
4. **Content Preparation** - Plan your autobiography structure
5. **Testing** - Make sure everything works correctly

---

## Phase 1: Environment Setup

### Step 1.1: Choose Your Setup Method

**Option A: Automated Setup (Recommended)**
- ✅ Easier for beginners
- ✅ Faster installation
- ✅ Handles most common issues automatically

**Option B: Manual Setup**
- ✅ More control over the process
- ✅ Better for learning
- ✅ Easier to troubleshoot if issues arise

### Step 1.2A: Automated Setup (Windows)

1. **Open PowerShell as Administrator**
   - Press `Windows + X`
   - Select "Windows PowerShell (Admin)" or "Terminal (Admin)"

2. **Navigate to the template folder**
   ```powershell
   cd path\to\autobiography_template
   ```

3. **Run the setup script**
   ```powershell
   .\setup_windows.ps1
   ```

4. **Follow the prompts** - The script will:
   - Install Ruby
   - Install Rails and dependencies
   - Set up the database
   - Start the application

5. **Skip to Phase 2** if successful

### Step 1.2B: Automated Setup (Mac/Linux)

1. **Open Terminal**
   - Press `Cmd + Space` and type "Terminal" (Mac)
   - Press `Ctrl + Alt + T` (Linux)

2. **Navigate to the template folder**
   ```bash
   cd path/to/autobiography_template
   ```

3. **Make the script executable**
   ```bash
   chmod +x setup_unix.sh
   ```

4. **Run the setup script**
   ```bash
   ./setup_unix.sh
   ```

5. **Follow the prompts** - The script will handle all installations

6. **Skip to Phase 2** if successful

### Step 1.3: Manual Setup (If Automated Failed)

#### Install Ruby

**Windows:**
1. Visit [rubyinstaller.org](https://rubyinstaller.org/)
2. Download Ruby+Devkit 3.0 or newer
3. Run the installer with default options
4. Open a new Command Prompt and verify: `ruby --version`

**Mac:**
```bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Ruby
brew install ruby
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt update
sudo apt install ruby-full build-essential zlib1g-dev
```

#### Install Rails and Dependencies

```bash
gem install rails bundler
```

#### Install Node.js (for asset compilation)

**Windows:** Download from [nodejs.org](https://nodejs.org)
**Mac:** `brew install node`
**Linux:** `sudo apt install nodejs npm`

---

## Phase 2: Template Installation

### Step 2.1: Install Ruby Dependencies

```bash
cd autobiography_template
bundle install
```

**If you see errors:**
- Try: `bundle config build.nokogiri --use-system-libraries`
- Then: `bundle install` again

### Step 2.2: Set Up Database

```bash
rails db:create
rails db:migrate
rails db:seed
```

### Step 2.3: Install JavaScript Dependencies

```bash
npm install
```

### Step 2.4: Compile Assets

```bash
rails assets:precompile
```

### Step 2.5: Start the Application

```bash
rails server
```

### Step 2.6: Verify Installation

1. **Open your browser**
2. **Visit:** http://localhost:3000
3. **You should see:** The M_C_Story homepage with sample chapters

**✅ Success Indicators:**
- Homepage loads without errors
- You can click on sample chapters
- Navigation works
- Styling looks correct

**❌ If you see errors:**
- Check the TROUBLESHOOTING.md guide
- Try restarting the server
- Verify all previous steps completed successfully

---

## Phase 3: Initial Customization

### Step 3.1: Update Site Information

**File:** `app/views/layouts/application.html.erb`

Find and update:
```erb
<title>[Your Name]'s Life Story</title>
```

Change to your name:
```erb
<title>John Smith's Life Story</title>
```

### Step 3.2: Update Homepage

**File:** `app/views/chapters/index.html.erb`

Find and update:
```erb
<h1 class="text-4xl font-bold text-gray-900 mb-2">[Your Name]'s Life Story</h1>
<p class="text-xl text-gray-600 mb-8">[Your tagline]</p>
```

Change to:
```erb
<h1 class="text-4xl font-bold text-gray-900 mb-2">John Smith's Life Story</h1>
<p class="text-xl text-gray-600 mb-8">A journey through life's adventures</p>
```

### Step 3.3: Update Navigation

**File:** `app/views/layouts/application.html.erb`

Find the navigation section and update links and text to match your preferences.

### Step 3.4: Add Your Profile Photo (Optional)

1. **Prepare your photo:**
   - Save as `profile.jpg` or `profile.png`
   - Recommended: 400x400 pixels, square format

2. **Copy to:** `app/assets/images/profile.jpg`

3. **Update About page** (`app/views/pages/about.html.erb`):
   ```erb
   <%= image_tag "profile.jpg", alt: "Your Name", class: "w-64 h-64 rounded-full object-cover shadow-lg mx-auto mb-8" %>
   ```

### Step 3.5: Test Your Changes

1. **Save all files**
2. **Refresh your browser** (or restart server if needed)
3. **Verify your changes appear correctly**

---

## Phase 4: Content Preparation

### Step 4.1: Plan Your Autobiography

1. **Open:** `docs/STORY_PLANNING_TEMPLATE.md`
2. **Follow the planning guide** to organize your thoughts
3. **Create a chapter outline**

### Step 4.2: Update the About Page

**File:** `app/views/pages/about.html.erb`

Replace placeholder content with:
- Your actual biographical information
- Your motivation for creating this autobiography
- What readers can expect to find

### Step 4.3: Plan Your First Chapter

1. **Choose your starting point:**
   - Early childhood memory
   - Pivotal life moment
   - Most interesting story

2. **Use the writing prompts** in the sample chapters for inspiration

### Step 4.4: Set Up Your Writing Environment

1. **Choose your text editor:**
   - VS Code (recommended for beginners)
   - Sublime Text
   - Atom
   - Even Notepad works!

2. **Create a writing schedule:**
   - Set aside regular time for writing
   - Start with small goals (15-30 minutes per session)

---

## Phase 5: Testing and Validation

### Step 5.1: Functionality Test

Test these features:
- [ ] Homepage loads correctly
- [ ] Navigation links work
- [ ] Sample chapters display properly
- [ ] About page shows your information
- [ ] Profile photo displays (if added)
- [ ] Site is responsive on mobile

### Step 5.2: Content Review

- [ ] All placeholder text has been replaced
- [ ] Navigation reflects your content
- [ ] Styling looks consistent
- [ ] No broken images or links

### Step 5.3: Performance Check

- [ ] Pages load quickly
- [ ] No console errors in browser
- [ ] All assets (CSS, JavaScript) load properly

### Step 5.4: Cross-Browser Test

Test in multiple browsers:
- [ ] Chrome
- [ ] Firefox
- [ ] Safari (Mac)
- [ ] Edge (Windows)

---

## 🎉 Completion Checklist

Congratulations! You've successfully set up M_C_Story. You should now have:

- [ ] ✅ Working Ruby on Rails application
- [ ] ✅ M_C_Story running locally
- [ ] ✅ Basic personalization completed
- [ ] ✅ Profile photo added (optional)
- [ ] ✅ Content plan created
- [ ] ✅ Testing completed successfully

## 🚀 What's Next?

Now that your setup is complete:

1. **Start writing!** Begin with your first chapter
2. **Read the documentation:**
   - CUSTOMIZATION.md for design changes
   - STORY_PLANNING_TEMPLATE.md for content guidance
   - FAQ.md for common questions

3. **When ready to share:**
   - DEPLOYMENT_GUIDE.md for publishing online

## 🆘 If Something Went Wrong

Don't panic! Common issues and solutions:

### Setup Script Failed
- Try running individual commands manually
- Check TROUBLESHOOTING.md for specific error messages
- Ensure you have admin/administrator privileges

### Application Won't Start
- Verify Ruby and Rails are installed: `ruby --version` and `rails --version`
- Try: `bundle install` followed by `rails server`
- Check for error messages in the terminal

### Styling Looks Broken
- Run: `rails assets:precompile`
- Restart the server
- Clear browser cache

### Changes Not Appearing
- Hard refresh browser (Ctrl+F5 or Cmd+Shift+R)
- Restart Rails server
- Check that you saved the files

## 📞 Getting Additional Help

If you're still stuck:
1. Review the TROUBLESHOOTING.md guide
2. Check the FAQ.md for your specific issue
3. Search online for your error message + "Ruby on Rails"
4. Ask a technically-inclined friend or family member
5. Consider hiring a local developer for setup assistance

## 🎯 Remember Your Goal

The technical setup is just the beginning. Your real goal is to:
- Preserve your life stories
- Share your experiences with family
- Create a lasting legacy
- Connect with future generations

Don't let technical challenges discourage you. Every problem has a solution, and the result—your personal autobiography website—will be worth the effort.

**Welcome to your autobiography journey!**
