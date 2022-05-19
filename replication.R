print('Hello, world!')




####日本語表記を図で使えないのをなんとかしたい####
getwd()
data03 <- read_csv("./causality-main/data03.csv")

library(tidyverse)
library(ggplot2)

g1 <- ggplot() +
geom_density(data=data03, mapping=aes(x1), color="black") +
geom_density(mapping=aes(y1Naive), color='red') +
geom_density(mapping=aes(y0Naive), color='blue') +
xlab("テストスコア") +
ylab("度数") +
theme_bw()


g2 <- data03 %>%
ggplot() +
geom_density(mapping=aes(y0t), color="blue") +
geom_density(mapping=aes(y1t), color='red') +
xlab("テストスコア") +
ylab("度数") +
theme_bw()


library(patchwork)
g1 + g2 +
  plot_layout(guides = 'collect', ncol=1)





## 図のなかで日本語を使えるようにする
## フォントの設定はお好みで
## （Unix/Linux ではIPAexフォントのインストールが必要かも）
library(fontregisterer)
if (.Platform$OS.type == "windows") { # Windows
  my_font <- "Yu Gothic"
} else if (capabilities("aqua")) { # macOS
  my_font <- "Hiragino Mincho ProN"
} else { # Unix/Linux
  my_font <- "IPAexGothic"
}
theme_set(theme_gray(base_size = 9,
                     base_family = my_font))