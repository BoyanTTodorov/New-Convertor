import tkinter as tk
import ttkbootstrap as ttkbs
from datetime import datetime
from querys import DatabaseHandler
import pandas as pd
from pandastable import Table

class Window(tk.Tk):
    def __init__(self) -> None:
        super().__init__()
        self.title("Convertor")
        self.geometry("800x600")
        self.resizable(False, False)
        self.style = ttkbs.Style(theme="flatly")

        self.theme_var = tk.StringVar(value="Switch to Dark Theme")
        self.theme_button = ttkbs.Button(self, textvariable=self.theme_var, command=self.toggle_theme, style="info.TButton")
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
        check_names = ["RLM", "1OM", "Plant"]
        self.checks = []

        for i, name in enumerate(check_names):
            var = tk.StringVar()
            self.checks.append(var)
            ttkbs.Checkbutton(self, text=name, padding=10, variable=var, onvalue=name, offvalue='').pack(side='left')

        self.db_handler = DatabaseHandler()

        self.start_date = ttkbs.DateEntry(self, style='success.TCalendar')
        self.start_date.pack(side='left', padx=10, pady=10)
        self.end_date = ttkbs.DateEntry(self, style='success.TCalendar')
        self.end_date.pack(side='left', padx=10, pady=10)

        self.input = tk.StringVar()
        entry = ttkbs.Entry(self, width=10, textvariable=self.input)
        entry.pack(side='left', padx=10, pady=10)
        ttkbs.Button(self, text="Search", style="success.Outline.TButton", command=self.get_data_and_query).pack(side='left', padx=10, pady=10)
        self.pack(fill=tk.BOTH, expand=False, padx=10, pady=10, side='top')

    def get_data_and_query(self):
        for check_var in self.checks:
            if check_var.get():
                try:
                    start_date_value = datetime.strptime(self.start_date.entry.get(), '%d/%m/%Y').strftime('%Y-%m-%d')
                    end_date_value = datetime.strptime(self.end_date.entry.get(), '%d/%m/%Y').strftime('%Y-%m-%d')
                    data = self.db_handler.get_data(check_var.get(), start_date_value, end_date_value, self.input.get())
                    
                    # Check if data is empty
                    if not data:
                        raise ValueError(f"No data found for table {check_var.get()}")

                    PandasTableApp(self.master, data, title=f"{check_var.get()} Data")
                except Exception as e:
                    # Show an error popup window with the exception message
                    tk.messagebox.showerror("Error", str(e))

class PandasTableApp:
    def __init__(self, master, data, title=None):
        self.df = pd.DataFrame(data, columns=['customer_item_number', 'start_date', 'action_date', 'qty', 'actions', 'exception_type', 'exception_message'])
        self.top = tk.Toplevel(master)
        self.top.title(title)

        rows, cols = self.df.shape
        width = max(300, cols * 100)
        height = max(200, rows * 30)
        self.top.geometry(f"{width}x{height}")

        self.frame = tk.Frame(self.top)
        self.frame.pack(fill='both', expand=True)
        self.table = Table(self.frame, dataframe=self.df)
        self.table.show()

# Create main window
app = Window()
