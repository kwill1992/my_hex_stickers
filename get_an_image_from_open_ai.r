# get an image from Open AI

# starting with this resource
# https://www.r-bloggers.com/2023/06/how-to-generate-a-hex-sticker-with-openai-and-cropcircles/

# run these if not installed
# install.packages("openai")
# install.packages("cropcircles")

library(openai)
library(cropcircles)

# be sure to get Open Ai api and key working as mentioned in the article

# need to add key to environ
# Sys.setenv(OPENAI_API_KEY = '<your-key-goes-here>')

# test it
x <- create_image('a cat with wings staring at a sunset')
# ok, got url as mentioned in the blog

library(magick)
image_read(x$data$url)
# that will plot it in viewer

# couldn't get this to work
image_write(x$data$url, "dumpsterfire.png")


# now to save to files
y <- image_read(x$data$url)
image_write(y, "~/Documents/r-studio-and-git/my_hex_stickers/open_ai_generated_images/catwithwingssunset.png")


image_read("~/Documents/r-studio-and-git/my_hex_stickers/open_ai_generated_images/catwithwingssunset.png")
xy <- image_read("~/Documents/r-studio-and-git/my_hex_stickers/open_ai_generated_images/catwithwingssunset.png")


library(showtext)

# choose a font from Google Fonts
font_add_google("Bangers", "bangers")
font_add_google("Roboto", "rob")
showtext_auto()
ft <- "bangers"
ft1 <- "rob"
txt <- "black"

# fontawesome fonts (optional - this adds the git logo - download from https://fontawesome.com/)
font_add("fa-brands", regular = "fonts/fontawesome-free-6.2.0-web/webfonts/fa-brands-400.ttf")

# package name and githu repo
pkg_name <- "dumpster\nFire"
git_name <- "doehm/dumpsterFire"

library(cropcircles)
img_cropped <- hex_crop(
    images = x$data$url,
    border_colour = "#107e54",
    border_size = 24
)


library(cropcircles)
img_cropped <- hex_crop(
    images = xy,
    border_colour = "#107e54",
    border_size = 24
)
library(tidyverse)
library(ggpath)
library(ggtext)
library(glue)

ggplot() +
    geom_from_path(aes(0.5, 0.5, path = img_cropped)) +

    # package name
    annotate("text", x = 0.5, y = 0.25, label = pkg_name, family = ft, size = 34,
             fontface = "bold", colour = txt, angle = 22, hjust = 0, lineheight = 0.25) +

    # add github - remove if not wanted
    annotate("richtext", x=0.46, y = 0.07, family = ft1, size = 10, angle = 15, colour = txt, hjust = 0,
             label = glue("<span style='font-family:fa-brands; color:{txt}'> </span> {git_name}"),
             label.color = NA, fill = NA) +

    xlim(0, 1) +
    ylim(0, 1) +
    theme_void() +
    coord_fixed()

ggsave("images/hex-dumpster-fire.png", height = 6, width = 6)
