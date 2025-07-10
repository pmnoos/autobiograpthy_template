# 🚀 Deployment Guide

This guide will help you publish your autobiography website so others can read your story online.

## 🌐 Deployment Options

### Option 1: Heroku (Recommended for Beginners)

Heroku is a cloud platform that makes it easy to deploy Ruby on Rails applications with minimal configuration.

#### Prerequisites
- A Heroku account (free at [heroku.com](https://heroku.com))
- Git installed on your computer
- Your autobiography app working locally

#### Step-by-Step Heroku Deployment

1. **Install Heroku CLI**
   - Visit [devcenter.heroku.com/articles/heroku-cli](https://devcenter.heroku.com/articles/heroku-cli)
   - Download and install for your operating system

2. **Prepare Your App for Production**
   ```bash
   # Make sure your Gemfile includes PostgreSQL for production
   # Add this to your Gemfile if not already present:
   group :production do
     gem 'pg'
   end
   
   # Run bundle install
   bundle install
   ```

3. **Initialize Git (if not already done)**
   ```bash
   git init
   git add .
   git commit -m "Initial commit for autobiography app"
   ```

4. **Login to Heroku**
   ```bash
   heroku login
   ```

5. **Create a New Heroku App**
   ```bash
   heroku create your-autobiography-app-name
   ```

6. **Set Environment Variables**
   ```bash
   heroku config:set RAILS_MASTER_KEY=$(cat config/master.key)
   ```

7. **Deploy to Heroku**
   ```bash
   git push heroku main
   ```

8. **Set Up the Database**
   ```bash
   heroku run rails db:create
   heroku run rails db:migrate
   heroku run rails db:seed
   ```

9. **Visit Your Live Site**
   ```bash
   heroku open
   ```

### Option 2: Railway

Railway is another beginner-friendly platform for deploying Rails apps.

#### Steps for Railway:

1. **Sign up at [railway.app](https://railway.app)**
2. **Connect your GitHub repository**
3. **Railway will automatically detect it's a Rails app**
4. **Add environment variables:**
   - `RAILS_MASTER_KEY` (copy from config/master.key)
5. **Deploy automatically happens on each git push**

### Option 3: DigitalOcean App Platform

1. **Create a DigitalOcean account**
2. **Use App Platform**
3. **Connect your GitHub repository**
4. **Configure build and run commands**
5. **Set environment variables**

### Option 4: Self-Hosting (Advanced)

For more control, you can deploy to your own server using:
- **VPS providers:** DigitalOcean, Linode, AWS EC2
- **Server setup:** Ubuntu + Nginx + Passenger
- **Database:** PostgreSQL
- **SSL:** Let's Encrypt

## 📋 Pre-Deployment Checklist

- [ ] App runs locally without errors
- [ ] All chapters and content are complete
- [ ] Profile photo and branding are updated
- [ ] Database seeds work correctly
- [ ] Environment variables are configured
- [ ] Production gems are added to Gemfile
- [ ] Git repository is up to date

## 🔒 Security Considerations

### Environment Variables
Never commit sensitive information to Git:
- Database passwords
- API keys
- Secret keys

### SSL Certificate
Most hosting platforms provide free SSL certificates. Make sure your site uses HTTPS.

### Database Backups
Set up regular database backups, especially if you continue adding content.

## 🎯 Custom Domain Setup

### With Heroku:
1. **Purchase a domain** from providers like Namecheap, GoDaddy, or Google Domains
2. **Add custom domain to Heroku:**
   ```bash
   heroku domains:add www.yourdomain.com
   heroku domains:add yourdomain.com
   ```
3. **Configure DNS settings** with your domain provider
4. **Add SSL certificate:**
   ```bash
   heroku certs:auto:enable
   ```

### DNS Configuration:
- **CNAME record:** www → your-app-name.herokuapp.com
- **ALIAS/ANAME record:** @ → your-app-name.herokuapp.com

## 🔧 Troubleshooting Deployment Issues

### Common Problems:

**"Application Error" on Heroku:**
- Check logs: `heroku logs --tail`
- Ensure master key is set correctly
- Verify database migrations ran successfully

**Assets not loading:**
- Run: `heroku run rails assets:precompile`
- Check that Tailwind CSS is building correctly

**Database issues:**
- Ensure PostgreSQL is configured for production
- Run migrations: `heroku run rails db:migrate`

**Environment variable problems:**
- List current variables: `heroku config`
- Set missing variables: `heroku config:set VARIABLE_NAME=value`

## 📊 Monitoring Your Live Site

### Heroku Metrics:
- Monitor dyno performance
- Check response times
- Monitor error rates

### Uptime Monitoring:
- Use services like UptimeRobot (free)
- Set up alerts for downtime

### Analytics:
- Add Google Analytics to track visitors
- Monitor which chapters are most popular

## 🔄 Updating Your Live Site

1. **Make changes locally**
2. **Test thoroughly**
3. **Commit to Git:**
   ```bash
   git add .
   git commit -m "Update content"
   ```
4. **Deploy to Heroku:**
   ```bash
   git push heroku main
   ```
5. **Run migrations if needed:**
   ```bash
   heroku run rails db:migrate
   ```

## 💰 Cost Considerations

### Heroku Pricing:
- **Hobby tier:** ~$7/month (recommended)
- **Free tier:** Limited hours, sleeps when inactive
- **PostgreSQL:** Free tier available, paid plans for more storage

### Domain Costs:
- **Domain registration:** $10-15/year
- **SSL certificate:** Usually free with hosting platforms

## 📞 Getting Help

If you encounter deployment issues:

1. **Check the logs** first (most issues are visible in logs)
2. **Search Stack Overflow** for your specific error message
3. **Consult platform documentation:**
   - [Heroku Rails Guide](https://devcenter.heroku.com/articles/getting-started-with-rails7)
   - [Railway Rails Guide](https://docs.railway.app/deploy/rails)
4. **Community forums** for your chosen platform

## 🎉 Post-Deployment

Once your site is live:
- [ ] Test all functionality on the live site
- [ ] Share the URL with family and friends
- [ ] Set up regular backups
- [ ] Monitor site performance
- [ ] Consider SEO optimization
- [ ] Add social media sharing buttons

Remember: Your story is worth sharing! Don't let technical details prevent you from getting your autobiography online. Start with the simplest option (Heroku) and you can always migrate later if needed.
