#--------- Section 1: Filter ---------#

library(tidyverse)
library(palmerpenguins)
library(lterdatasampler)

# Look for an exact match: ==

penguins_biscoe <- penguins |> filter(island == "Biscoe")

penguins_2007 <- penguins |> filter(year == 2007)

adelie_torgersen <- penguins |> filter(species == "Adelie" & island == "Torgersen")
# Alternative: penguins |> filter(species == "Adelie", island == "Torgersen")

# Create a subset from penguins that only contains Gentoo penguins observed in 2008
gentoos_2008 <- penguins |> filter(species == "Gentoo", year == 2008)

# Create subset that contains Gentoos and Adelies
gentoo_adelie <- penguins |> filter(species == "Gentoo" | species == "Adelie")

# Create a subset that contains observations where the island is Dream OR the year is 2009

dream_or_2009 <- penguins |> filter(island == "Dream" | year == 2009)

# Make a ggplot chart of water temperature versus crab size:

ggplot(data = pie_crab, aes(x = water_temp, y = size)) +
  geom_point()

# Keep observations for sites NIB, ZI, DB, JC

# pie_crab |> filter(site == "NIB" | site == "ZI" | site == "DB" | site == "JC")
# We can use the %in% operator to ask: does the value in our column match ANY of the values IN this vector?

pie_sites <- pie_crab |> filter(site %in% c("NIB", "ZI", "DB", "JC"))

# Run a line of code in the Console to confirm that only the sites above remain in the new subset you created

sites <- c("CC", "BB", "PIE")

pie_sites_2 <- pie_crab |> filter(site %in% sites)

# Create a subset using the %in% operator that includes sites PIE, ZI, NIB, BB, and CC

pie_crab |> filter(site %in% c("PIE", "ZI", "NIB", "BB", "CC"))

# Excluding filter statements

# != (asks is this NOT equal to that value)?

exclude_zi <- pie_crab |> filter(site != "ZI")

# What if I want to exclude sites "BB", "CC", "PIE"

exclude_bb_cc_pie <- pie_crab |> filter(!site %in% c("BB", "CC", "PIE"))

# Create a subset from pie_crab that only contains observations from NIB, CC, and ZI, for crabs with carapace size exceeding 13

crabs_large <- pie_crab |> filter(site %in% c("NIB", "CC", "ZI"),
                                  size > 13)

#-------- Selecting columns --------#
