################################################################################
# Pablo Haya, 2019
################################################################################
library(tidyverse)
library(here)

species <- read_csv(here("data","gestationoffsprings.csv"))

################################################################################
# Data cleaning
################################################################################
# Transform the original dataset
# from 
# CommonName  Gestation Offspring
# <chr>       <chr>     <chr>
# Panda rojo  112-158   1-4
#
# to
# CommonName  MinGestation MaxGestation MinOffspring MaxOffspring MeanGestation MeanOffspring
# <chr>       <int>        <int>        <int>        <int>         <dbl>         <dbl>
# Panda rojo  112          158            1            4           135           2.5

species <-
    species %>%
    separate(Gestation, c("MinGestation", "MaxGestation"), 
             sep="-", fill="right", convert=TRUE) %>%
    mutate(MaxGestation=replace(MaxGestation, 
                                is.na(MaxGestation), 
                                MinGestation[is.na(MaxGestation)])) %>%
    mutate(MeanGestation=rowMeans(.[c("MinGestation", "MaxGestation")]))

species <-
    species %>%
    separate(Offspring, c("MinOffspring", "MaxOffspring"), 
             sep="-", fill="right", convert=TRUE) %>%
    mutate(MaxOffspring=replace(MaxOffspring, 
                                is.na(MaxOffspring), 
                                MinOffspring[is.na(MaxOffspring)])) %>%
    mutate(MeanOffspring=rowMeans(.[c("MinOffspring", "MaxOffspring")]))
    
# Fix lion gestation unit from weeks to days
species <-
    species %>%
    mutate(MinGestation=ifelse(CommonName=="Leon asia", MinGestation*7, MinGestation)) %>%
    mutate(MaxGestation=ifelse(CommonName=="Leon asia", MaxGestation*7, MaxGestation))

write_csv(species, path = here("data","gestationoffsprings_clean.csv"))

################################################################################
# Visualization
################################################################################
species <- species %>% mutate(color=ifelse(CommonName %in% c("Tigre bengala", 
                                                          "Leon asia", 
                                                          "Lince",
                                                          "Leopardo"), 1, 0))
species <- species %>% mutate(color=ifelse(CommonName %in% c("Humano"), 2, color))
species <- species %>% mutate(shape=ifelse(CommonName %in% c("Humano"), 1, 0))

pdf(here("images","adayzoo.pdf"))
main_chart <-
    ggplot(data=species, aes(x=MeanOffspring, y=MeanGestation,
                           color=factor(color))) +
        geom_point(aes(shape=factor(shape), alpha=0.95, size=ifelse(shape==1, 4, 1))) +
        geom_text(aes(label=CommonName), check_overlap=TRUE, hjust=0, nudge_x=0.075) + 
        xlim(1, 7) + 
        labs(title="A day at zoo",
             x="# Offsprings", 
             y="Gestation period (days)") +
        theme_minimal() +
        theme(legend.position = "none")
dev.off()

reg <- lm(MeanOffspring ~ MeanGestation, data = species)
summary(reg)

save(main_chart, reg, file = here("data","outcomes.RData"))