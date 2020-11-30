import camelot

file = "test.pdf"
tables = camelot.read_pdf(file)
print("Total tables extracted:", tables.n)
print(tables[0].df)m