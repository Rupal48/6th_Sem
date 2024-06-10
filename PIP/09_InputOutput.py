# input_file = r"C:\Users\Asus\Downloads\Study\College\Codes\6th_Sem\PIP\Input.txt"
# with open(input_file, 'r') as f1:
#     data = f1.read()
# output_file = r"C:\Users\Asus\Downloads\Study\College\Codes\6th_Sem\PIP\Output.txt"
# with open(output_file, 'w') as f2:
#     convertedData = data.upper()
#     f2.write(convertedData)

input_file = r"C:\Users\Asus\Downloads\Study\College\Codes\6th_Sem\PIP\Input.txt"
f1 = open(input_file,'r')
data = f1.read()
f1.close()
output_file = r"C:\Users\Asus\Downloads\Study\College\Codes\6th_Sem\PIP\Output.txt"
f2 = open(output_file,'w')
convertedData = data.upper()
f2.write(convertedData)
f2.close()