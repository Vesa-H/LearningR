# Here's an example of a conflict.

# Packages ----------------------------------------------------------------

library(tidyverse)
library(NHANES)

# This will be used for testing out Git


# Looking at data ---------------------------------------------------------

glimpse(NHANES)

select(NHANES, Age, Weight)

select(NHANES, -HeadCirc)

select(NHANES, starts_with("BP"))
select(NHANES, ends_with("Day"))
select(NHANES, contains("Age"))

nhanes_small <- select(
  NHANES,
  Age,
  Gender,
  BMI,
  Diabetes,
  PhysActive,
  BPSysAve,
  BPDiaAve,
  Education
)
nhanes_small

# Fixing variable names ---------------------------------------------------

nhanes_small <- rename_with(
  nhanes_small,
  snakecase::to_snake_case
)
nhanes_small

nhanes_small <- rename(
  nhanes_small,
  sex = gender # new name first
)
nhanes_small


# Piping ------------------------------------------------------------------

colnames(nhanes_small)

nhanes_small %>%
  colnames()
nhanes_small %>%
  select(phys_active) %>%
  rename(
    physically_active = phys_active
  )
