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


# Exercise 7.8 ------------------------------------------------------------

nhanes_small %>%
  select(bp_sys_ave, education)

nhanes_small %>%
  rename(
    bp_sys = bp_sys_ave,
    bp_dia = bp_dia_ave
  )


# select(nhanes_small, bmi, contains("age"))

nhanes_small %>%
  select(bmi, contains("age"))

# blood_pressure <- select(nhanes_small, starts_with("bp_"))
# rename(blood_pressure, bp_systolic = bp_sys)

nhanes_small %>%
  select(starts_with("bp")) %>%
  rename(bp_systolic = bp_sys_ave)


# Filtering rows ----------------------------------------------------------

nhanes_small %>%
  filter(phys_active == "No")

nhanes_small %>%
  filter(bmi >= 25 & # You can also use , instead of &
    phys_active == "No")

nhanes_small %>%
  filter(bmi == 25 | # Means "or"
    phys_active == "No")


# Arranging rows ----------------------------------------------------------

nhanes_small %>%
  arrange(desc(age), bmi)


# Mutating columns --------------------------------------------------------

nhanes_small %>%
  mutate( # If you want to create something new just create it with a name that doesnt exist already
    age_month = age * 12,
    logged_bmi = log(bmi),
    age_weeks = age_month * 4,
    old = if_else(
      age >= 30, # if this is true
      "old", # then old
      "young" # otherwise young
    )
  )
