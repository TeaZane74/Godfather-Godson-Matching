"""On souhaite matcher des parrains et des filleuls selon des critères précis"""
"""Critères : - Préférence pour un pôle différent si possible
            - Caractère, timide = 1, calme = 2, sociable = 3, fêtard = 4 
            -   préférence de sortie, Culturelle = 1, se poser dans un parc = 2, boire un verre = 3, faire la fête = 4 
            - mission préférée à ESN : Accueillir et intégrer les internationaux = 1, sensibilisation à la mobilité internationale = 2 
            - Nous calculons aussi la distance entre les arrondissments afin qu'ils n'aient pas à faire trop de trajet pour se voir"""
"""En calculant les différentes distances nous calculons la fonction d'utilité de chaque parrain pour chaque filleul, et nous prenons le maximum"""



import sqlite3
conn = sqlite3.connect(r"projet_python.db")

filleul_imp = conn.execute("SELECT * FROM filleul").fetchall()
colonnes_filleul = conn.execute("PRAGMA table_info(filleul)").fetchall()
FILLEUL = {
	i: {
		colonnes_filleul[i+1][1]: el[i]
		for i in range(len(colonnes_filleul)-1)
	}
	for i, el in [[x[0],x[1:]] for x in filleul_imp]
}

parrain_imp = conn.execute("SELECT * FROM parrain").fetchall()
colonnes_parrain = conn.execute("PRAGMA table_info(parrain)").fetchall()
PARRAIN = {
	i: {
		colonnes_parrain[i+1][1]: el[i]
		for i in range(len(colonnes_parrain)-1)
	}
	for i, el in [[x[0],x[1:]] for x in parrain_imp]
}

coordonnée_lieu = {
    x[0]: x[1:]
    for x in conn.execute("SELECT id, latitude, longitude FROM Lieu").fetchall()
}


rep_pole = {
    'CV': str(FILLEUL).count('CV'),
    'FS': str(FILLEUL).count('FS'),
    'COM': str(FILLEUL).count('COM'),
    'PART': str(FILLEUL).count('PART'),
}


def distance(x: list, y: list) -> float:
    """ norme euclidienne """
    assert len(x) == len(y)
    return sum([(i - j) ** 2 for i, j in zip(x, y)]) ** (1/2)

def distance_lieu(filleul: dict, parrain: dict) -> float:
    """ distance physique filleul/parrain """
    d_filleul = coordonnée_lieu[filleul['Lieu']]
    d_parrain = coordonnée_lieu[parrain['Lieu']]
    return distance(d_filleul, d_parrain)

def distance_caractere(filleul: dict, parrain: dict) -> float:
    """ distance caractère filleul/parrain """
    c_filleul = (filleul['Adjectif'], filleul['Preference'], filleul['Mission'])
    c_parrain = (parrain['Adjectif'], parrain['Preference'], parrain['Mission'])
    return distance(c_filleul, c_parrain)

def mul_pole(filleul: dict, parrain: dict) -> float:
    """ multiplicateur d'utilité par pôle (on souhaite avoir des matchs de pôles différents) """
    if filleul['Pole'] == parrain['Pole']:
        pole = 0.1
    else:
        pole = 1.0
    return pole

def utilite(filleul: dict, parrain: dict) -> float:
    """ utilité du match ... """
    return mul_pole(filleul, parrain) * (10 - 2.5 * distance_caractere(filleul, parrain) - 5 * distance_lieu(filleul, parrain))

def filter_max(D):
    """ récupération de l'utilité max, de plus, nous essayons de placer en priorité les parrains du même pôle que le pôle le plus représenté (afin de minimiser le nombre de match du même pôle""")
    maxu = [x for x in D if D[x] == D[max(D, key = D.get)]]
    maxu_pole = [x for x in maxu if PARRAIN[x]['Pole'] == max(rep_pole, key = rep_pole.get)]
    if maxu_pole:
        maxu = maxu_pole 
    return maxu

def update_dict(filleul: dict, parrain: dict):
    """ un match a été fait, on marque le filleul et on
        décrémente les matchs souhaités du parrain
    """
    parrain['Nb_filleul'] -= 1
    filleul['Parrain'] = True

def condition(filleul: dict) -> bool:
    """ le filleul a-t-il un parrain ? """
    return 'Parrain' in filleul

def main():
    """ point d'entrée """
    import random
    tableau_match = {}
    while len([1 for filleul in FILLEUL.values() if filleul.get("Parrain", False)]) != len(FILLEUL):
        i = random.choice([index for index, filleul in FILLEUL.items() if not condition(filleul)])
        tableau_utilite = {
            index: utilite(FILLEUL[i], parrain)
            for index, parrain in PARRAIN.items()
            if parrain['Nb_filleul'] != 0
        }
        match_i = random.choice(filter_max(tableau_utilite))
        parrain = PARRAIN[match_i]
        tableau_match[i] = {
            'Filleul': f"{FILLEUL[i]['Prenom']} {FILLEUL[i]['Nom']}",
            'Parrain': f"{parrain['Prenom']} {parrain['Nom']}",
            'Match Ratio': round(tableau_utilite[match_i]/10, 2)
        }
        update_dict(FILLEUL[i], parrain)
    return tableau_match


if __name__ == "__main__":
    res = main()
    for i in range (1000);
        res2 = main()
        if 
    
    for match in res.values():
        print(f"{match['Filleul']} -- {match['Parrain']}, Taux de match : {match['Match Ratio']}")
    print(f"Nombre de matchs : {len(res)}")
