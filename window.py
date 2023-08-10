import tkinter as tk
import ttkbootstrap as ttkbs
from querys import DatabaseHandler
from datetime import datetime

class Window(tk.Tk):
    def __init__(self) -> None:
        super().__init__()
        self.title("Convertor")
        self.geometry("800x600")
    
        self.resizable(False, False)
        self.style = ttkbs.Style(theme="flatly")
        self.CheckFrame = UserInputFrame(self)
        self.mainloop()

class UserInputFrame(ttkbs.Frame):
    def __init__(self, parent) -> None:
        super().__init__(parent)
        ttkbs.Label(self, text="Select").pack(side='left')
        check_names = ["RLM", "1-O-M", "PLANT"]
        self.checks = []

        for i, name in enumerate(check_names):
            var = tk.StringVar()
            self.checks.append(var)
            ttkbs.Checkbutton(self, text=name, padding=10, variable=var, onvalue=name, 
                              offvalue='', command=lambda i=i :print(self.checks[i].get())).pack(side='left')

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
        data = []
        for i in range(3):
            if self.checks[i].get():
                start_date_value = datetime.strptime(self.start_date.entry.get(), '%d/%m/%Y').strftime('%Y-%m-%d')
                end_date_value = datetime.strptime(self.end_date.entry.get(), '%d/%m/%Y').strftime('%Y-%m-%d')
                print(self.checks[i].get())
                db_handler = DatabaseHandler()
                print(start_date_value, end_date_value, self.input.get())
                data = db_handler.get_data(self.checks[i].get(), start_date_value, end_date_value, self.input.get())
                print(data)
                return data



