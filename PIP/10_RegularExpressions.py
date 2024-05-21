import re
pattern = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b'
file_name = r'C:\Users\Asus\Downloads\Study\College\Codes\6th_Sem\PIP\Input.txt'
with open(file_name, 'r') as f1:
    text = f1.read()
    matches = re.findall(pattern, text)
print("Instances found:", matches)
