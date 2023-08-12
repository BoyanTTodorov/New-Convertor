from pandastable import Table
import pandas as pd
import tkinter as tk

class PandasTableApp:
    def __init__(self, data, title=None):
        self.data = data
        self.df = pd.DataFrame(data)
        self.root = tk.Tk()
        self.frame = tk.Frame(self.root)
        self.frame.pack(fill='both', expand=True)
        self.table = Table(self.frame, dataframe=self.df)
        self.table.show()
        
    def run(self):
        self.root.mainloop()

