import re

def find_pattern_in_file(pattern, filename):
    try:
        with open(filename, 'r') as file:
            text = file.read()
            matches = re.findall(pattern, text)
            return matches
    except FileNotFoundError:
        print("File not found.")
        return []

# Example usage:
pattern_to_find = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'  # Example pattern: Email addresses
file_name = r'C:\Users\Asus\Downloads\Study\College\Codes\6th_Sem\PIP\Input.txt'  # Change this to the path of your text file
found_instances = find_pattern_in_file(pattern_to_find, file_name)
print("Instances found:", found_instances)
