def convert_file(input_file, output_file):
    try:
        with open(input_file, 'r') as input_f:
            data = input_f.read()    
        with open(output_file, 'w') as output_f:
            converted_data = data.upper()
            output_f.write(converted_data)       
        print("Conversion completed successfully.")
    except FileNotFoundError:
        print("Input file not found.")
    except Exception as e:
        print("An error occurred:", e)

input_file = r"C:\Users\Asus\Downloads\Study\College\Codes\6th_Sem\PIP\Input.txt"
output_file = r"C:\Users\Asus\Downloads\Study\College\Codes\6th_Sem\PIP\Output.txt"
convert_file(input_file, output_file)