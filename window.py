import tkinter as tk
import ttkbootstrap as ttkbs
from datetime import datetime
from querys import DatabaseHandler
from pandastable import Table
import pandas as pd

class Window(tk.Tk):
    def __init__(self) -> None:
        super().__init__()
        self.title("Convertor")
        self.geometry("800x600")
    
        self.resizable(False, False)
        self.style = ttkbs.Style(theme="flatly")

        self.theme_var = tk.StringVar(value="Switch to Dark Theme")
        self.theme_button = ttkbs.Button(self, textvariable=self.theme_var, 
                                         command=self.toggle_theme, style="info.TButton")
        self.theme_button.pack(side='top', anchor='w')

        self.CheckFrame = UserInputFrame(self)
        self.mainloop()

    def toggle_theme(self):
        if self.style.theme_use() == "flatly":
            self.style.theme_use("darkly")
            self.theme_var.set("Switch to Light Theme")
        else:
            self.style.theme_use("flatly")
            self.theme_var.set("Switch to Dark Theme")

class UserInputFrame(ttkbs.Frame):
    def __init__(self, parent) -> None:
        super().__init__(parent)
        check_names = ["RLM", "1-O-M", "PLANT"]
        self.checks = []

        for i, name in enumerate(check_names):
            var = tk.StringVar()
            self.checks.append(var)
            ttkbs.Checkbutton(self, text=name, padding=10, variable=var, onvalue=name, 
                            offvalue='', command=lambda i=i: print(self.checks[i].get())).pack(side='left')


        self.db_handler = DatabaseHandler()  # Initialize DatabaseHandler once

        self.start_date = ttkbs.DateEntry(self, style='success.TCalendar')
        self.start_date.pack(side='left', padx=10, pady=10)
        self.end_date = ttkbs.DateEntry(self, style='success.TCalendar')
        self.end_date.pack(side='left', padx=10, pady=10)

        self.input = tk.StringVar()
        entry = ttkbs.Entry(self, width=10, textvariable=self.input)
        entry.pack(side='left', padx=10, pady=10)
        ttkbs.Button(self, text="Search", style="success.Outline.TButton", 
                     command=self.get_data_and_query).pack(side='left', padx=10, pady=10)
        self.pack(fill=tk.BOTH, expand=False, padx=10, pady=10, side='top')
    
    def get_data_and_query(self):
        for check_var in self.checks:
            print(check_var.get())
            if check_var.get():
                start_date_value = datetime.strptime(self.start_date.entry.get(), '%d/%m/%Y').strftime('%Y-%m-%d')
                end_date_value = datetime.strptime(self.end_date.entry.get(), '%d/%m/%Y').strftime('%Y-%m-%d')
                data = self.db_handler.get_data(check_var.get(), start_date_value, end_date_value, self.input.get())
                table = PandasTableApp(data, title=f"{check_var.get()} Data")
                table.run()

class PandasTableApp:
    def __init__(self, data, title=None):
        self.data = data
        self.df = pd.DataFrame(data)
        
        # Determine the size of the window based on the data shape
        rows, cols = self.df.shape
        width = max(300, cols * 100)  # 100 pixels per column (adjust as needed)
        height = max(200, rows * 30)  # 30 pixels per row (adjust as needed)
        
        self.root = tk.Tk()
        self.root.title(title)
        self.root.geometry(f"{width}x{height}")  # Set the window size
        
        self.frame = tk.Frame(self.root)
        self.frame.pack(fill='both', expand=True)
        self.table = Table(self.frame, dataframe=self.df)
        self.table.show()

    def run(self):
        self.root.mainloop()

# Create main window
app = Window()
