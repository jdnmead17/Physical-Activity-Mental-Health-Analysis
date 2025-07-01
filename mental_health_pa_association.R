#Import data
library(NHANES)
NHANES <- NHANES

#Scatterplot of target variables
plot(NHANES$DaysMentHlthBad~NHANES$PhysActiveDays, 
     xlab = "Days per Week Physically Active", 
     ylab = "Days Mental Health 'Not Good' (in last month)",
     main = "Scatterplot of Mental Health as a Function of Physical Activity")

#Restructure NHNES
library(dplyr)
nhanes <- NHANES %>% filter(!is.na(PhysActiveDays)) %>%
  filter(!is.na(DaysMentHlthBad)) %>%
  mutate(phys_activity = case_when(
      PhysActiveDays >= 1 & PhysActiveDays <= 2 ~ "Low",
      PhysActiveDays >= 3 & PhysActiveDays <= 4 ~ "Moderate",
      PhysActiveDays > 4 ~ "High"),
    ment_hlth_bad = case_when(
      DaysMentHlthBad == 0 ~ "No",
      DaysMentHlthBad > 0 ~ "Yes")) %>%
  select(ment_hlth_bad, phys_activity)

#Proportion table
nhanes <- nhanes %>% mutate(ment_hlth_bad = factor(ment_hlth_bad,
                              levels = c("Yes", "No")),
                            phys_activity = factor(phys_activity, 
                              levels = c("Low", "Moderate", "High")))
my_table <- table(nhanes$phys_activity, nhanes$ment_hlth_bad)
knitr::kable(round(prop.table(my_table, 2), 2), 
      caption = "Proportions of Physical Activity Frequency(Low, Moderate, High) 
                 vs. Occurence 'Bad' Mental Health Days (Yes/No)")

#Barplot
library(ggplot2)
install.packages('ggthemes')
library(ggthemes)
prop_df <- as.data.frame(prop.table(mytable, 1)) %>%
  rename(phys_activity = Var1,
         ment_hlth_bad = Var2,
         proportion = Freq)
ggplot(prop_df, aes(phys_activity, proportion, fill = ment_hlth_bad)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(title = "Mental Health vs. Physical Activity", 
       x = "Physical Activity Level", 
       y = "Percentage",
       fill = "Reported days with poor mental health?") + 
  geom_text(aes(label =  scales::percent(proportion)),
            position = position_stack(vjust = 0.5)) +
  scale_y_continuous(labels = scales::percent) +
  theme_tufte() + 
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

#Chi-Square test
(my_chi <- chisq.test(my_table))
knitr::kable(round(mychi$stdres, 2), 
                   caption =  "Standard Residuals from Chi-Square Test of 
                   Physical Activity (Low, Moderate, High) vs. 
                   Mental Health (Yes/No)")