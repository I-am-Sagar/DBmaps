# DBmaps

## Overview

**DBmaps** is an R package designed to streamline the process of analyzing relational database structures. It simplifies the task of merging and joining tables by automatically identifying linkages between tables, reducing the need for extensive manual knowledge of key relationships.

## Features

- **Database Mapping:** Generates a visual representation of how tables in a relational database are connected.
- **Automated Join Detection:** Identifies possible joins between tables and suggests linking variables.
- **User-Specified Maps:** Allows users to define known relationships for improved documentation and accuracy.
- **Search Algorithm for Linking Paths:** Finds indirect connections through intermediate tables.
- **Automated Data Set Construction:** Enables users to select variables from specific tables and construct the final dataset efficiently.

## Installation

To install the **DBmaps** package, you can use the `devtools` package from GitHub. Follow the steps below:

```r
# Install devtools package (if not already installed)
install.packages("devtools")

# Install DBmaps from GitHub
devtools::install_github("I-am-Sagar/DBmaps", build_vignettes = TRUE)
```

## Usage

### Merging Tables with `merge_all_tables()`

The `merge_all_tables()` function allows you to merge multiple tables in one operation. Here's an example of merging three tables:

```r
# Load sample data
data(students)
data(scores)
data(attendance)

# Perform a three-way merge
result <- merge_all_tables(
  students, 
  scores, 
  attendance,
  by_col = "id",              # Column to join by
  merge_type = "inner",       # Type of merge (inner, left, right, etc.)
  final_merge_type = "inner"  # Final merge type after multiple merges
)

# Display merged data
head(result)
```

### Best Practices

To ensure the best results when using DBmaps, keep the following in mind:

1. **Verify unique identifiers in your key columns:** Ensure that the columns you are merging by contain unique values.
2. **Check for NA values in the final dataset:** After merging, check the result for any missing values that may affect your analysis.
3. **Consider the merge order:** When merging multiple tables, the order of operations can impact the result, especially in the case of left, right, or full joins.

## Session Info

For reproducibility, it's important to check your session info. Here's how to print the session details:

```r
sessionInfo()
```

## Contributing

If you would like to contribute to the DBmaps package, feel free to open an issue or submit a pull request. Contributions to improve the functionality, documentation, or bug fixes are welcome!

## License

DBmaps is licensed under the MIT License. See LICENSE for more information.