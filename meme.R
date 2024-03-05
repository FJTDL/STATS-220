library(magick)

# Actual code below

# First experimental meme
#is_this_meme <- image_read("https://i.guim.co.uk/img/media/44856f0611a6ae5e8f4e1875772d8f462a7e6f10/0_139_1118_671/master/1118.jpg?width=1200&quality=85&auto=format&fit=max&s=879e85646e59ea6a7aab83a1e66ab506") %>%
# image_scale(550) %>%
#image_annotate(text="Is this free data?",
#              font="Impact",
#             gravity="south",
#            size=30,
#           color="#FFF") %>%
#image_annotate(text="Students",
#              font="Impact",
#             location="+400+90",
#            size=20,
#           color="#FFF") %>%
#image_annotate(text="Stats Lecturers",
#              font="Impact",
#             location="+130+20",
#            size = 20,
#           color="#FFF")




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

# Twist
thousand <- image_read("https://i0.wp.com/www.the-american-interest.com/wp-content/uploads/2016/09/Tom_Lea_-_2000_Yard_Stare.jpg?fit=1000%2C634&ssl=1") %>%
  image_scale(250)

# The thing worse
hellish_box <- image_blank(height=156, width=250, color="#000") %>%
  image_annotate(text="Probability", color="#FFF", gravity="center", size=40, font="Impact")

# Creating the second bottom vector and animating it
second_bottom_vector <- c(thousand, hellish_box)
second_bottom_image <- image_append(second_bottom_vector)
bottom_line <- image_animate(c(bottom_image, second_bottom_image), fps=1)

final_meme <- image_composite(my_meme, bottom_line, offset="+0+141")
#final_meme  <- image_composite(partial_meme, bottom_right, offset="+260+141")
final_meme
image_write(my_meme, "meme.gif")