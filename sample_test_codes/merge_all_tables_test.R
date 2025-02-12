library(DBmaps)

# Loading the sample data
data(students)
data(scores)
data(attendance)

result <- merge_all_tables(students, scores, attendance, merge_type = "left",
                           final_merge_type = "full")
print(result)
