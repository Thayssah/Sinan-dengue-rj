# TODOS OS ANOS EM .DBF PARA .CSV
import csv
from dbfread import DBF
from pathlib import Path

pasta_origem = Path(r"C:\Users\alves\Desktop\dados dengue\dados dengue 2015-2025\dados dbf") 
pasta_destino = Path(r"C:\Users\alves\Desktop\dados dengue\dados csv")

pasta_destino.mkdir(parents=True, exist_ok=True)

for arquivo in pasta_origem.glob("*.dbf"):
    tabela = DBF(str(arquivo))
    with open(pasta_destino / f"{arquivo.stem}.csv", 'w', encoding='utf-8', newline='') as f:
        writer = csv.writer(f, delimiter=';')
        writer.writerow(tabela.field_names)
        writer.writerows(list(registro.values()) for registro in tabela)
    #print(f"Convertido: {arquivo.name}")       