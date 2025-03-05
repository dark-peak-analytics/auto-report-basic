# This example is designed to show how a report could be updated using GitHub Actions. 
# 
# The report & analysis is trivially simple, but the report PDF should update
# every time there is a change to the data.
#

# Read in the data & calculate the ICER
df_inputs <- read.csv(file = "data/df_inputs.csv", 
                      row.names = 1)

# Calculate the incremental costs and qalys
incCost <- df_inputs["cost", "trt"] - df_inputs["cost", "soc"]
incQaly <- df_inputs["qaly", "trt"] - df_inputs["qaly", "soc"]

# Calculate the ICER
ICER <- incCost / incQaly

# render the Rmarkdown report from the script.
rmarkdown::render(input = "report/report.Rmd",
                  params = list(ICER = ICER),
                  output_dir = "outputs",
                  output_file = "report.pdf")
