# Vessel Extended

## Changelog

### [2020.06.29]

- Fixed `$COMPOSE` variable (was labeled as `docker-composer`)
- Adjusted `showVersion` override to better align extended versioning information
- Adjust `mycli` command to conditionally supply password (dont use `-p` flag if no password)
- Forced sourcing of `.env` as database settings were not being read

### [2019.03.10]

- Added `mycli` entrypoint -- see [https://www.mycli.net/](https://www.mycli.net/)
- Added `dbcli` entrypoint (mycli alias)
- Added `db` entrypoint (mysql alias)

### [2018.03.17]

- Initial Relase
