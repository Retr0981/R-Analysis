# Load the readxl library
library(readxl)

# Load the Excel file into R
Amazon <- read_excel("Amazon.xlsx")

# View the first few rows of the dataset
head(Amazon)

# Summary statistics for the dataset 
summary(Amazon)

# Plot a histogram of User Ratings
hist(Amazon$`User Rating`, main="Distribution of User Ratings", xlab="User Rating", col="blue")

# Sort the data by the number of reviews in descending order
top_reviews <- Amazon[order(-Amazon$Reviews), ][1:10, ]
top_reviews

# Calculate total reviews per year
avg_rating_genre <- aggregate(Amazon$`User Rating`, by=list(Genre=Amazon$Genre), FUN=mean)
avg_rating_genre

# Scatter plot of Price vs User Rating
plot(Amazon$Price, Amazon$`User Rating`, main="Price vs User Rating", xlab="Price", ylab="User Rating", col="red", pch=16)



# Total reviews over time
reviews_by_year <- aggregate(Amazon$Reviews, by=list(Year=Amazon$Year), FUN=sum)
plot(reviews_by_year$Year, reviews_by_year$x, type="o", main="Total Reviews Over Time", xlab="Year", ylab="Total Reviews", col="green")


# Save the top 10 reviewed books
write.csv(top_reviews, "Top_10_Reviewed_Books.csv")

