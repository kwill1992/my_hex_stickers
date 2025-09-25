# Creating a file which has stickers for what I've worked with.

# Almost all credit to Mitchell O'Hara-Wild @
# https://www.mitchelloharawild.com/blog/hexwall/
# https://github.com/mitchelloharawild/hexwall
# https://github.com/mitchelloharawild/hexwall/blob/master/hexwall.R


# Look at this also:
# https://www.mitchelloharawild.com/blog/user-2018-feature-wall/


hex_folder <- "~/Documents/r-studio-and-git/my_hex_stickers/Stickers"

download.file(
    url = "https://github.com/rstudio/hex-stickers/archive/master.zip",
    destfile = file.path(hex_folder, "rstudio-hex.zip")
)

unzip(
    zipfile = file.path(hex_folder, "rstudio-hex.zip"),
    exdir = hex_folder
)

path <- file.path(hex_folder, "hex-stickers-master", "PNG")

# Remove the non-image files
unlink(list.files(path, full.names = TRUE)[tools::file_ext(list.files(path)) %in% c("md", "Rmd")])

list.files(path)

# Preparation
#
# Before we start aligning the hexagons, we first need to convert them to a common size and format. In most cases, the conversion can be done automatically with the ROpenSci magick package.
#
# All images can be read with image_read, however better quality for svg and png formats can be obtained using their specific reading functions. As many stickers had white backgrounds (especially pdf format images), I first convert white to transparent, and then use image_trim to automatically crop the images.

library(magick)
library(purrr)

# This below works.  It just takes a bit to run!!!  Over a minute.

sticker_files <- list.files(path)
stickers <- file.path(path, sticker_files) %>%
    map(function(path){
        switch(tools::file_ext(path),
               svg = image_read_svg(path),
               pdf = image_read_pdf(path),
               image_read(path))
    }) %>%
    map(image_transparent, "white") %>%
    map(image_trim) %>%
    set_names(sticker_files)
stickers
