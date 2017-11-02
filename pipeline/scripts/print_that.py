import csv
 
with open("/scripts/random.csv") as f:
  reader = csv.reader(f)
  for row in reader:
    print(row)

