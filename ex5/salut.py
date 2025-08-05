import sys

# Verificare daca a fost introdus un argument
if len(sys.argv) != 2:
    print("Eroare: Introdu un nume ca argument. Ex. ( python3 salut.py NUME )")
    sys.exit(1)

# Extragem numele din argumentele introduse in comanda
nume = sys.argv[1]

# Return argument nume
print(f"Salut, {nume}")