import requests
from os import path



def clean_groundstations():
    lines = ["name,latitude,longitude,hae,id\n"]
    with open("groundstation_locations_Spire.csv") as gs_csv:
        i = 0
        for line in gs_csv:
            if "L" in line:
                continue  # skip the header

            coord = line.strip().split(",")

            if len(coord) != 2:
                continue

            i += 1
            coord = ["gsd_" + str(i)] + coord + ["0.0", str(i)]
            coord = ",".join(coord) + "\n"
            lines.append(coord)

    with open("spire_gd.csv", "w+") as out:
        out.writelines(lines)


def retrieve_and_format_tles():
    norad_ids = []
    with open("spire-norads-cleaned.txt") as norads:
        for row in norads:
            norad_ids.append(row.strip())

    for norad_id in norad_ids:
        x = requests.get("http://tle.spire.com/" + norad_id)
        if not x.ok:
            print("error")
            continue
        x = str(x.content)
        x = x[4:-1]
        lines = x.split("\\n")[:-1]
        lines = [line + "\n" for line in lines]
        lines[0] = lines[0].replace(" ", "-")
        with open("tles/" + lines[0][:-1], "w+") as f:
            f.writelines(lines)


def clean_scraped_norads():
    rows = []
    cleaned_rows = []
    with open("spire-norads.txt") as norads:
        for row in norads:
            rows.append(row.strip())

    for row in rows:
        i = row.index("4") if ('4' in row) else 2000
        j = row.index("5") if ('5' in row) else 2000
        if i < j:
            row = row[i:i+5]
        else:
            row = row[j:j+5]
        cleaned_rows.append(row + "\n")

    with open("spire-norads-cleaned.txt", 'w') as out:
        out.writelines(cleaned_rows)


if __name__ == "__main__":
    clean_groundstations()
    clean_scraped_norads()
    retrieve_and_format_tles()
