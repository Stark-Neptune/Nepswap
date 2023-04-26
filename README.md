# Nepswap

## Compile smart contract

```
scarb build
```

## Test smart contract

Use `cairo-test`

```
cairo-test --starknet --path .
```

## Declare and deploy smart contract

Declare:

```sh
starknet declare --contract ${sierra_path} --account ${startnet_account}
```

Deploy:

```sh
starknet deploy --class_hash ${class_hash} --inputs ${constructor_param_1} ${constructor_param_2}  --account ${startnet_account}
```

## Commitizen

[Commitizen](https://github.com/commitizen/cz-cli) is a tool for writing qualified Commit messages.

Installing the command line tool

```bash
npm install -g commitizen
```

Then, in the project directory, run the following command to support Angular's Commit Message format.

```bash
commitizen init cz-conventional-changelog --save --save-exact
```

Use `git cz` instead of `git commit`. At this point, options are presented to generate a Commit message that matches the format.