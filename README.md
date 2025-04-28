# bash-test

**bash-test** is a lightweight Bash framework designed for writing structured and robust system tests. It is ideal for system administrators, DevOps engineers, and others looking to automate system validation tasks using simple shell scripts.

## Features

- Structured start and end markers for each test.
- Automatic error trapping and reporting.
- Support for expected failure scenarios.
- Flexible verbosity options for muted, verbose, and very verbose outputs.
- Defaults to very clean output.
- Extremely minimal external dependencies.

## Getting Started

### Prerequisites

bash-test relies on standard Unix utilities and a POSIX-compliant shell.  
If certain core utilities are missing, it attempts to install them automatically.

### Usage

To use **bash-test**, set the environment variable **BT_PROJECT_DIR**, then simply source it in your Bash script:

```bash
source "$BT_PROJECT_DIR/bash-test"
```

Then structure your tests like so:

```bash
btStartTest "Check that the directory exists"
  ls -ld "/path/to/dir"

btStartTest "Check that binary is executable"
  ls -ld "/path/to/binary"
  "/path/to/binary" --version
```
( Note that the spacing here is purely for readability. )

### Options

You can control behavior with optional flags:

| Flag             | Description                    |
|------------------|---------------------------------|
| `-i`, `--ignore-errors` | Ignore errors without exiting immediately |
| `-v`, `--verbose` | Enable verbose output |
| `-vv`, `--very-verbose` | Enable very verbose (debug-level) output |

Example invocation:

```bash
./your-test-script.sh -v
```

## Example

Here’s a very simple example checking a software installation:

```bash
#!/bin/bash

source "$BT_PROJECT_DIR/bash-test"

software_root="/usr/local/yoursoftware"

btStartTest "Software directory exists"
  ls -ld "$software_root"

btStartTest "Binaries exist"
  ls -ld "$software_root/bin/yourbinary"

btStartTest "Configuration files exist"
  ls -ld "$software_root/etc/config.cfg"

btStartTest "Software passes basic tests"
  "$software_root/bin/yourbinary" --test
```

## License

This project is licensed under the [MIT License](LICENSE).

---

**Note:**  
bash-test is intended to be simple, adaptable, and flexible to suit a variety of system validation needs. Minimal maintenance is needed for integrating small changes in testing workflows.

