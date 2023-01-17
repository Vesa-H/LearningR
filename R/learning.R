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
