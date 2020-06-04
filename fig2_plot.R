##### Create Figure 3 ####

options(stringsAsFactors = FALSE)
library(survminer)
library(ggplot2)
library(patchwork)
library(dplyr)

load('~/Documents/Writing/Papers/2020 HolekampStrauss - Female reproduction/Final/fig2_data.RData')

a <- ggplot(repro.df, aes(x = as.numeric(stan_rank), y = age.at.part))+
  geom_point(alpha = 0.7)+
  geom_smooth(method = 'lm', color = 'black', se = FALSE, size= 0.5)+
  geom_smooth(method = 'lm', color = alpha('black', 0.5), se = FALSE, size = 1)+
  theme_classic()+
  xlab('[Low]     Standardized rank     [High]')+
  ylab('Age at parturition (months)')+
  coord_cartesian(clip = 'off')


b <- ggplot(filter(repro.df, repro.length > 2, !is.na(dob)), aes(x = as.numeric(stan_rank), y = cubs.per.year, size = repro.length))+
  geom_point(alpha = 0.7)+
  geom_smooth(method = 'lm', color = 'black', se = FALSE, size= 0.5)+
  geom_smooth(method = 'lm', color = alpha('black', 0.5), se = FALSE, size = 1)+
  theme_classic()+
  theme(legend.position = 'none') +
  xlab('[Low]     Standardized rank     [High]')+
  ylab('Offspring produced per year')

png(filename = '~/Documents/Writing/Papers/2020 HolekampStrauss - Female reproduction/Final/Figures/Figure3.png',
    width = 7, height = 3, units = 'in', res = 1000)
a+b +plot_annotation(tag_levels = 'A')
dev.off()
