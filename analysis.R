# This example is designed to show how a report could be updated using GitHub Actions. 
# 
# The report & analysis is trivially simple, but the report PDF should update
# every time there is a change to the data.
#
time <-  Sys.time()

write.csv(x = time,
          file = "time.csv")