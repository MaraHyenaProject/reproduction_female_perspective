#### Plot Figure 4 #### 

options(stringsAsFactors = FALSE)
library(ggplot2)
library(survminer)
library(dplyr)

load('~/Documents/Writing/Papers/2020 HolekampStrauss - Female reproduction/Final/fig4_data.RData')


#### Black and white - flat
pdf(file = '~/Documents/Writing/Papers/2020 HolekampStrauss - Female reproduction/Final/Figures/Figure4.pdf', width = 8, height = 6)
ggplot(matriarch.prop.flat, aes(x = year, ymin = cum.prop, ymax = y.max, group = matriarch))+
  geom_ribbon(fill = 'white',color =  'black')+
  geom_ribbon(data = dead.ribbons.flat, aes(x = year, ymin = cum.prop, ymax = y.max),
              fill = 'grey70', color = 'black')+
  geom_ribbon(data = label.ribbons.flat, aes(x = x.start, ymin = cum.prop, ymax = y.max), fill = 'white',
              size = 0.7, color = 'black')+
  survminer::theme_survminer()+
  geom_text(data = filter(matriarch.prop, year == 1979),
            aes(x = 1979, y = (19.5-rank)*prop.norm, label = alt.id),
            size =5)+
  scale_x_continuous(breaks = c(1979, 1989, 1999, 2009, 2019), expand = c(0,0))+
  theme(legend.position = 'none')+
  xlab('Year')+
  ylab('Percent adult females in clan')+
  scale_y_continuous(sec.axis = dup_axis(breaks = c(0.9, 0.1), labels = c('  High', '  Low'), name = 'Rank'),
                     expand = c(0,0), breaks = c(0.2, 0.4, 0.6, 0.8, 1),
                     labels = c('20%', '40%', '60%', '80%', '100%'))+
  theme(axis.ticks.y.right = element_blank(),
        axis.title.y.right = element_text(vjust = -5))+
  geom_vline(xintercept = c(1977, 1981,1987, 1991, 1997, 2001, 2007, 2011, 2017, 2021))
dev.off()