library(data.table)

# Loading the sample data
data(students)
data(scores)
data(attendance)

# ---------------------------- EASY TASK ------------------------------------- #

# Inner Join (only matching rows)
inner_merge <- merge(students, scores, by = "id")
print(inner_merge)

# Left Join (all rows from students, matching from scores)
left_merge <- merge(students, scores, by = "id", all.x = TRUE)
print(left_merge)

# Right Join (all rows from scores, matching from students)
right_merge <- merge(students, scores, by = "id", all.y = TRUE)
print(right_merge)

# Full Join (all rows from both)
full_merge <- merge(students, scores, by = "id", all = TRUE)
print(full_merge)


