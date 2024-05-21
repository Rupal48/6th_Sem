input_file = r"C:\Users\Asus\Downloads\Study\College\Codes\6th_Sem\PIP\Input.txt"
with open(input_file, 'r') as f1:
    data = f1.read()
output_file = r"C:\Users\Asus\Downloads\Study\College\Codes\6th_Sem\PIP\Output.txt"
with open(output_file, 'w') as f2:
    convertedData = data.upper()
    f2.write(convertedData)