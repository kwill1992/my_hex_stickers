# Test hexwall from here: https://github.com/mitchelloharawild/hexwall

# load hexwall.R function
source("~/Documents/r-studio-and-git/my_hex_stickers/hexwall/hexwall.R")
# call hexwall function and assign to "test"
test <- hexwall("~/Documents/r-studio-and-git/my_hex_stickers/hexwall/samplehex", sticker_row_size = 3, sticker_width = 200)
test


png("~/Documents/r-studio-and-git/my_hex_stickers/hexwall/samplehex/test123.png")
hexwall("~/Documents/r-studio-and-git/my_hex_stickers/hexwall/samplehex", sticker_row_size = 3, sticker_width = 200)
image_write(test, "~/Documents/r-studio-and-git/my_hex_stickers/hexwall/samplehex/test123.png")
dev.off()
