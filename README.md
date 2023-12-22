# Dutch Addresses Database Builder

This repository provides a Dockerfile for building a Docker image that incorporates the latest Dutch addresses database. The primary purpose of this repository is to construct the database used by [maantje/postcode](https://github.com/maantje/postcode).

## Features

- **Up-to-Date Data**: The Docker image includes the latest Dutch addresses data.
- **Easy Integration**: Simply build the Docker image to have the database ready for use.
- **Compact Image Size**: The Docker image is optimized for efficiency, with a small size of only 350.21 MB.

## Usage

1. Pull the image:

```bash
docker pull ghcr.io/maantje/postcode-database:latest
```

2. Run the container:

```bash
docker run postcode-database
```

3. Identify the container ID:
```bash
docker ps
```

4. Extract the SQLite database:

```bash
docker cp {CONTAINER ID}:/database/addresses.sqlite.gz addresses.sqlite.gz
```

```bash
gunzip addresses.sqlite.gz
```

You now have the addresses.sqlite file containing all Dutch addresses in your current directory.


### Creating Your Own Image

Create a new image with the latest dataset published by "Basisregistratie Adressen en Gebouwen (BAG)."

1. Clone the repository:

```bash
git clone https://github.com/maantje/postcode-database.git
```

2. Build the image
```bash
docker build -t postcode-database .
```

### Preview 5 of 9,733,992 rows
| postcode | house_number | addition | extension       | municipality       | city         | street               | long_street           | short_street           | area | usage                   | built_in | latitude           | longitude           |
|----------|--------------|----------|-----------------|--------------------|--------------|-----------------------|-----------------------|------------------------|------|-------------------------|----------|--------------------|---------------------|
| 8625HN   | 7            |          |                 | Súdwest-Fryslân    | Oppenhuizen  | H.Mensonidesstrjitte | H.Mensonidesstrjitte |    | 102.0 | woonfunctie              | 1968     | 53.0080687674733   | 5.69822400977741   |
| 8625HN   | 8            |          |                 | Súdwest-Fryslân    | Oppenhuizen  | H.Mensonidesstrjitte | H.Mensonidesstrjitte |    | 90.0  | woonfunctie              | 1973     | 53.007807591146    | 5.69844561439292   |
| 8625HN   | 9            |          |                 | Súdwest-Fryslân    | Oppenhuizen  | H.Mensonidesstrjitte | H.Mensonidesstrjitte |    | 102.0 | woonfunctie              | 1968     | 53.0080865456794   | 5.69829862822244   |
| 8625HN   | 10           |          |                 | Súdwest-Fryslân    | Oppenhuizen  | H.Mensonidesstrjitte | H.Mensonidesstrjitte |    | 88.0  | woonfunctie              | 1973     | 53.0078433412622   | 5.69852036113297   |
| 8625HN   | 11           |          |                 | Súdwest-Fryslân    | Oppenhuizen  | H.Mensonidesstrjitte | H.Mensonidesstrjitte |    | 187.0 | woonfunctie              | 1972     | 53.0086124447057   | 5.69994121873635   |

## Thanks

Special thanks to @digitaldutch for their contribution to [https://github.com/digitaldutch/BAG_parser](https://github.com/digitaldutch/BAG_parser), which makes this repository possible.