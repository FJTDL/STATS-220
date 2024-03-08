library(magick)

# Drake hating
drake_panel_1 <- image_read("https://i.ytimg.com/vi/wAbnNZDhYrA/maxresdefault.jpg") %>%
  image_scale(250)

# What drake hates
hated_box <- image_blank(height=141, width=250, color="#000") %>%
  image_annotate(text="Mathematics", color="#FFF", gravity="center", size=40, font="Impact")

# Drake agreeing
drake_panel_2 <- image_read("https://www.telegraph.co.uk/content/dam/music/2016/11/30/drake_trans_NvBQzQNjv4BqZPnXlBHEdt8AtjizIYNgmZhw_iIPZqUNP2EjAIFcGyw.jpg") %>%
  image_scale(250)

# What drake likes
liked_box <- image_blank(height=156, width=250, color="#000") %>%
  image_annotate(text="Statistics", color="#FFF", gravity="center", size=40, font="Impact")

# Creating the top and bottom vectors
top_vector <- image_append(c(drake_panel_1, hated_box))
bottom_vector <- image_append(c(drake_panel_2, liked_box))

# Animating the first bottom bar vector
bottom_image <- image_animate(bottom_vector)

# Combining the vectors into one
total_vector <- c(top_vector, bottom_vector)
my_meme <- image_append(total_vector, stack=TRUE)


# Saving the static meme
image_write(my_meme, "static.jpg")

# Twist
thousand <- image_read("https://i0.wp.com/www.the-american-interest.com/wp-content/uploads/2016/09/Tom_Lea_-_2000_Yard_Stare.jpg?fit=1000%2C634&ssl=1") %>%
  image_scale(250)

# The thing worse
hellish_box <- image_blank(height=158, width=250, color="#000") %>%
  image_annotate(text="Probability", color="#FFF", gravity="center", size=40, font="Impact")



# Top line replacement
happy <- image_read("https://i.kym-cdn.com/photos/images/original/001/625/518/1fa.jpg") %>%
  image_scale(167)
what_makes_us_happy <- image_blank(height=141, width=333, color="#000") %>%
  image_annotate(text="Graph theory", color="#FFF", gravity="center", size=40, font="Impact")
happy_vector <- image_append(c(happy, what_makes_us_happy))
#happy_vector


# Total anarchy
fear_image <- image_read("https://www.peta.org/wp-content/uploads/2018/12/screenshot_hamster_tweet.jpg") %>%
  image_scale(167)
what_scares_me <- image_blank(height=297, width=333, color="#000") %>%
  image_annotate(text="English", color="#FFF", gravity="center", size=40, font="Impact") 
what_scares_me
scary_vector <- image_append(c(fear_image, what_scares_me))


# Creating the second bottom vector and animating it
second_bottom_vector <- c(thousand, hellish_box)
second_bottom_image <- image_append(second_bottom_vector)
second_bottom_image
bottom_line <- c(bottom_image, second_bottom_image)

# The final meme requires the animated vector to be composed on the top
final_meme <- image_composite(my_meme, bottom_line, offset="+0+141") #%>%
final_meme <- image_append(c(top_vector, second_bottom_image), stack=TRUE)
final_meme
happy_frame <- image_append(c(happy_vector, second_bottom_image), stack=TRUE) 
happy_frame
all_frames_vector <- c(my_meme, final_meme, happy_frame, scary_vector)
absolute <- image_animate(all_frames_vector, fps=0.5)
absolute
# Saving the gif
#image_write(final_meme, "meme.gif")
