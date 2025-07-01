# Effect of Physical Activity Frequency on Self-Reported Mental Health

## Overview
I investigate the relationship between the frequency of physical activity and mental health. Specifically is there a 
correlation between the weekly frequency with which an individual engages in moderate-to-vigorous physical activity and the
likelihood of having acute, adverse mental health outcomes?

## Data Source
The National Health and Nutrition Survey (NHANES) dataset available in the Comprehensive R Archive Network (CRAN).

## Key Findings
A chi-square reveals that frequency of physical activity is inversely proportional to the probability of having "poor
mental health days". Post hoc analysis using the standardized residuals suggests that this holds only among the highest and
lowest physical activty groups.

## Skills Demonstrated

### Exploratory Data Analysis
    - Data manipulation using 'dplyr'
    - Exploratory visualization
    - Data cleaning
    - Feature engineering
    
### Visualization
    - Table coonstruction with 'knitr'
    - Explanatory visualization with 'ggplot2'
    
### Statistical Analysis
    - Hypothesis testing (chi-square)
    - Post-hoc analysis (standardized residuals)
    - Critical thinking (discussion of limitations and suggestions for further study; comparison with existing literature)

## How to Run
Clone this repository, open the .Qmd (for full report) or .R (for raw script) file in Posit Cloud or RStudio, and run the 
code.

## Link to Report
[View Full Report (HTML)](effect_of_physical_activity_frequency_on_mental_health.html)
