#takes a fasta file of multiple and one of a single sequences, creates individual fasta file for each sequence with the single sequence, used for individually aligning tblastx hits to the query
#!/bin/bash

# Check if the correct number of command-line arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <input_file> <single_element_file> <output_directory>"
    exit 1
fi

input_file="$1"
single_element_file="$2"
output_directory="$3"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Input file not found: $input_file"
    exit 1
fi

# Check if the single element file exists
if [ ! -f "$single_element_file" ]; then
    echo "Single element file not found: $single_element_file"
    exit 1
fi

# Create the output directory if it doesn't exist
mkdir -p "$output_directory"

# Initialize variables to store the current element and its name
current_element=""
element_name=""
element_counter=0

# Read the input file line by line
while IFS= read -r line; do
    # Check if the line starts with '>'
    if [[ "$line" == ">"* ]]; then
        # If it's a new element, process the previous element
        if [ -n "$current_element" ]; then
            # Remove quotes from the element name
            element_name_without_quotes="${element_name//\"/}"
            
            # Check if a file with the same name already exists
            element_filename="$output_directory/$element_name_without_quotes.fa"
            while [ -e "$element_filename" ]; do
                ((element_counter++))
                element_filename="$output_directory/$element_name_without_quotes-$element_counter.fa"
            done
            
            echo "Creating $element_filename"
            echo "$current_element" > "$element_filename"
            
            # Append a single element from the other input file to the new file
            cat "$single_element_file" >> "$element_filename"
        fi
        # Start a new element
        current_element="$line"
        
        # Extract the element name from the line (remove leading '>')
        element_name="${line#>}"
    else
        # Append the line to the current element
        current_element="$current_element"$'\n'"$line"
    fi
done < "$input_file"

# Process the last element
if [ -n "$current_element" ]; then
    # Remove quotes from the element name
    element_name_without_quotes="${element_name//\"/}"
    
    # Check if a file with the same name already exists
    element_filename="$output_directory/$element_name_without_quotes.fa"
    while [ -e "$element_filename" ]; do
        ((element_counter++))
        element_filename="$output_directory/$element_name_without_quotes-$element_counter.fa"
    done
    
    echo "Creating $element_filename"
    echo "$current_element" > "$element_filename"
    
    # Append a single element from the other input file to the new file
    cat "$single_element_file" >> "$element_filename"
fi
