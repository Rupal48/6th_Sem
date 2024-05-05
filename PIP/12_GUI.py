import tkinter as tk

def calculate():
    try:
        num1 = float(entry_num1.get())
        num2 = float(entry_num2.get())
        operation = dropdown_operation.get()

        if operation == '+':
            result = num1 + num2
        elif operation == '-':
            result = num1 - num2
        elif operation == '*':
            result = num1 * num2
        elif operation == '/':
            if num2 == 0:
                result = "Error: Division by zero"
            else:
                result = num1 / num2
        else:
            result = "Invalid operation"

        label_result.config(text="Result: " + str(result))
    except ValueError:
        label_result.config(text="Error: Invalid input")

# Create GUI window
window = tk.Tk()
window.title("Simple Calculator")

# Entry widgets for numbers
entry_num1 = tk.Entry(window)
entry_num1.grid(row=0, column=0)

entry_num2 = tk.Entry(window)
entry_num2.grid(row=0, column=1)

# Dropdown for operations
dropdown_operation = tk.StringVar(window)
dropdown_operation.set('+')  # default value
dropdown = tk.OptionMenu(window, dropdown_operation, '+', '-', '*', '/')
dropdown.grid(row=0, column=2)

# Button to calculate
button_calculate = tk.Button(window, text="Calculate", command=calculate)
button_calculate.grid(row=1, columnspan=3)

# Label to display result
label_result = tk.Label(window, text="Result:")
label_result.grid(row=2, columnspan=3)

# Start the GUI event loop
window.mainloop()
