df <- read.csv("/scripts/random.csv", header = FALSE)
df <- df * 0.3 + 2
print(df)
write.csv(df, "/scripts/random_update.csv")

