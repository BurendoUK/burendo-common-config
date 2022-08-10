# burendo-common-config

The repository holds configuration for infrastructure which is common amongst many services.

This is configuration that those services can them individually consume, rather than recreating many copies of the same configuration which have to be maintained.

## Usage

### First run
`pip3 install -r requirements.txt`

### Bootstrap

Create your AWS session with the cli, and assume the `Administrator` role. For this I persoanlly use [awsume](https://awsu.me/).

then:

`make bootstrap`
