#!/bin/bash
echo "Content-type: text/plain"
echo

# Extract variables from the query string
IFS='&' read -ra query_vars <<< "$QUERY_STRING"
declare -A variables

for query_var in "${query_vars[@]}"; do
  IFS='=' read -r -a var <<< "$query_var"
  key=${var[0]}
  value=${var[1]}
  variables["$key"]="$value"
done

# Access the variables
min_size=${variables["variable1"]}
cutoff_date=${variables["variable2"]}

# Знаходимо файли, які відповідають параметрам пошуку, і виводимо їх перелік на екран
echo "Files:"
find . -type f -size +$min_size -newermt $cutoff_date

# Вибираємо файли для видалення (файли .txt)
echo "Delete .txt files..."
find . -type f -size +$min_size -name "*.txt" -newermt $cutoff_date -delete

# Виводимо список файлів, які залишились в каталозі, або повідомляємо, що каталог порожній
remaining_files=$(ls)
if [ -z "$remaining_files" ]; then
    echo "Catalog empty."
else
    echo "Files left:"
    find . -type f -size +$min_size -newermt $cutoff_date
fi