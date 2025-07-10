module ContentHelper
  # Helper class for managing autobiography content
  
  def self.generate_sample_content(user_name = "[Your Name]")
    {
      chapters: [
        {
          title: "The Early Years",
          content: generate_chapter_template("childhood"),
          position: 1,
          published: true
        },
        {
          title: "Growing Up",
          content: generate_chapter_template("adolescence"),
          position: 2,
          published: true
        },
        {
          title: "Finding My Path",
          content: generate_chapter_template("young_adult"),
          position: 3,
          published: true
        },
        {
          title: "Building a Life",
          content: generate_chapter_template("adulthood"),
          position: 4,
          published: true
        },
        {
          title: "Wisdom and Reflections",
          content: generate_chapter_template("reflections"),
          position: 5,
          published: true
        }
      ],
      about_page: generate_about_template(user_name),
      homepage_intro: generate_homepage_template(user_name)
    }
  end

  def self.generate_chapter_template(life_stage)
    templates = {
      childhood: <<~CONTENT,
        ## My Childhood

        This is where you can write about your early years. Consider including:

        - Where you were born and raised
        - Your family background
        - Early memories that shaped you
        - Childhood friends and experiences
        - School memories
        - Family traditions and holidays

        **Writing Prompts:**
        - What is your earliest memory?
        - Who were the most important people in your childhood?
        - What games or activities did you love?
        - What was your neighborhood like?
        - What family stories were passed down to you?

        Replace this template text with your own personal stories and memories.
      CONTENT

      adolescence: <<~CONTENT,
        ## The Teenage Years

        Write about your adolescent years and the experiences that helped shape who you became:

        - High school experiences
        - First jobs or responsibilities
        - Friendships and relationships
        - Challenges you faced
        - Achievements and proud moments
        - Dreams and aspirations you had

        **Writing Prompts:**
        - What were you passionate about as a teenager?
        - Who influenced you the most during these years?
        - What challenges did you overcome?
        - What were your hopes and dreams for the future?
        - What lessons did you learn about yourself?

        Use this space to share your authentic teenage experience.
      CONTENT

      young_adult: <<~CONTENT,
        ## Finding My Way

        Share stories about your journey into adulthood:

        - College or career beginnings
        - Moving away from home
        - Important relationships
        - Major decisions you made
        - Successes and setbacks
        - Moments of growth and discovery

        **Writing Prompts:**
        - What were your biggest dreams at this stage?
        - What challenges did you face leaving home?
        - Who supported you during this transition?
        - What were you most proud of achieving?
        - How did you handle uncertainty and change?

        Tell your story of becoming who you are today.
      CONTENT

      adulthood: <<~CONTENT,
        ## Building My Life

        Describe the experiences of your adult life:

        - Career development and achievements
        - Marriage, partnership, or family life
        - Major life decisions and changes
        - Personal growth and learning
        - Community involvement
        - Adventures and travels

        **Writing Prompts:**
        - What are you most proud of in your adult life?
        - How have your priorities changed over time?
        - What relationships have been most meaningful?
        - What challenges have made you stronger?
        - What adventures or experiences stand out?

        Share the story of the life you've built.
      CONTENT

      reflections: <<~CONTENT
        ## Looking Back, Looking Forward

        Reflect on your life journey and share your wisdom:

        - Life lessons you've learned
        - Advice you'd give to your younger self
        - What you're most grateful for
        - How you've grown and changed
        - Your hopes for the future
        - The legacy you want to leave

        **Writing Prompts:**
        - What are the most important lessons life has taught you?
        - What would you tell someone just starting their journey?
        - What are you most grateful for?
        - How do you want to be remembered?
        - What wisdom would you pass on to future generations?

        Use this space to share your deepest reflections and insights.
      CONTENT
    }

    templates[life_stage] || "Write your story here..."
  end

  def self.generate_about_template(user_name)
    <<~ABOUT
      # About #{user_name}

      Welcome to my autobiography website. This is where I share the story of my life, the experiences that have shaped me, and the wisdom I've gained along the way.

      ## My Story

      [Write a brief introduction about yourself here. Include key details like where you're from, what you're passionate about, and why you decided to share your story.]

      ## Why I'm Sharing My Story

      [Explain your motivation for creating this autobiography. What do you hope readers will gain from your experiences?]

      ## What You'll Find Here

      Throughout these pages, you'll discover:
      - Stories from different periods of my life
      - Lessons I've learned along the way
      - Photos and memories that capture important moments
      - Reflections on life, growth, and change

      ## Get in Touch

      I'd love to hear from you! Whether you have questions about my story or want to share your own experiences, feel free to reach out.

      **Email:** [Your Email]
      **Location:** [Your Location]

      Thank you for taking the time to read my story. I hope it inspires you to reflect on your own journey and perhaps share your story with others.
    ABOUT
  end

  def self.generate_homepage_template(user_name)
    <<~HOMEPAGE
      # Welcome to #{user_name}'s Life Story

      Every life is a unique journey filled with experiences, lessons, and moments that shape who we become. This is my story - a collection of memories, reflections, and insights from a life lived with purpose and passion.

      ## Explore My Journey

      Browse through the chapters of my life below. Each section covers a different period, sharing the experiences, challenges, and triumphs that have made me who I am today.

      Whether you're here to learn about my journey, find inspiration for your own path, or simply enjoy a good story, I'm glad you're here.

      **Start reading below, and thank you for being part of my story.**
    HOMEPAGE
  end

  def self.writing_prompts_by_category
    {
      childhood: [
        "What was your favorite place to play as a child?",
        "Describe a typical day in your childhood home.",
        "Who was your childhood hero and why?",
        "What was your most treasured possession as a child?",
        "Tell about a time you got in trouble as a kid."
      ],
      family: [
        "What family traditions did you grow up with?",
        "Describe your relationship with your siblings.",
        "What did you learn from your parents?",
        "Tell about a memorable family vacation.",
        "How has your family influenced who you are today?"
      ],
      education: [
        "What was your favorite subject in school?",
        "Describe a teacher who made a difference in your life.",
        "Tell about your best friend in school.",
        "What extracurricular activities were you involved in?",
        "How did your education shape your future?"
      ],
      career: [
        "What was your first job like?",
        "Describe a mentor who helped guide your career.",
        "Tell about a professional challenge you overcame.",
        "What achievement are you most proud of?",
        "How has your career evolved over time?"
      ],
      relationships: [
        "How did you meet your life partner?",
        "Describe your closest friendship.",
        "Tell about someone who changed your perspective on life.",
        "What relationships have been most meaningful to you?",
        "How have your relationships shaped you?"
      ],
      challenges: [
        "Describe a difficult time in your life and how you overcame it.",
        "Tell about a fear you conquered.",
        "What was the hardest decision you ever had to make?",
        "How did you handle a major disappointment?",
        "What challenge made you stronger?"
      ],
      achievements: [
        "What accomplishment are you most proud of?",
        "Describe a goal you worked hard to achieve.",
        "Tell about a time you surprised yourself.",
        "What recognition or award meant the most to you?",
        "How do you define success?"
      ],
      reflections: [
        "What advice would you give to your younger self?",
        "What are the most important lessons you've learned?",
        "How have your values changed over time?",
        "What are you most grateful for?",
        "What legacy do you want to leave?"
      ]
    }
  end
end
