# Vessel Extended
### [WIP] Much more to come

Extends stock Vessel with additional utility commands

## Installation

First, install and configure `vessel`

[Vessel Website](https://vessel.shippingdocker.com/)

1. Download `vessel-extended.sh` to same directory as `vessel` 

    ```bash
    # using curl
    curl https://raw.githubusercontent.com/mikeerickson/cd-vessel-extended/master/vessel-extended.sh --output vessel-extended.sh
    ```

    ```bash
    # using wget
    wget -O vessel-extended.sh https://raw.githubusercontent.com/mikeerickson/cd-vessel-extended/master/vessel-extended.sh
    ```

2. Customize `Vessel` adding the following to the Vessel Command section

    ```bash
    #patch vessel with customized commands
    source vessel-extended.sh
    ```

3. Verify installation, executing on the extended commands

    `$ ./vessel version`

    and you should see the current version of Vessel Extended

    ```
    Vessel version 3.0.1e-2018.03.18
    ```

4. Do something else

## Commands

#### version ####
shows the current version of Vessel Extended

#### vars | env ###
shows all exposed (exported) variables

#### rebuild ####
rebuilds the current `app` container and restarts services

#### mysql ####
runs `mysql cli` in the mysql container

## Credits

vessel-extended written by Mike Erickson

E-Mail: [codedungeon@gmail.com](mailto:codedungeon@gmail.com)

Twitter: [@codedungeon](http://twitter.com/codedungeon)

Website: [github.com/mikeerickson](https://github.com/mikeerickson)
