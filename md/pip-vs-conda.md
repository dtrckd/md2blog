Here is a table comparing the usage and equivalence between using pip and conda to install, update, and remove Python libraries:

| Action                                   | pip Command                                          | conda Command                                      |
|------------------------------------------|------------------------------------------------------|----------------------------------------------------|
| Install a package                        | `pip install package_name`                           | `conda install package_name`                       |
| Update a package                         | `pip install --upgrade package_name`                 | `conda update package_name`                        |
| Remove a package                         | `pip uninstall package_name`                         | `conda remove package_name`                        |
| List installed packages                  | `pip list`                                           | `conda list`                                       |
| Search for a package                     | `pip search package_name`                            | `conda search package_name`                        |
| Install a specific version of a package  | `pip install package_name==version_number`           | `conda install package_name=version_number`        |
| Update pip itself                        | `pip install --upgrade pip`                          | `conda update pip`                                 |
| Install a package from a specific source | `pip install -i URL package_name`                    | `conda install --channel URL package_name`         |
| Install a package without dependencies   | `pip install --no-deps package_name`                 | `conda install --no-deps package_name`             |
| Show package information                 | `pip show package_name`                              | `conda info package_name`                          |
| Check for outdated packages              | `pip list --outdated`                                | `conda outdated`                                   |
| Install a package in a specific environment | `pip install -t directory package_name`           | `conda install --name environment_name package_name` |
| Create a new environment                 | N/A  (use virtualenv or venv)                        | `conda create --name environment_name`             |
| Activate an environment                  | `source activate environment_name` or `activate environment_name` (Windows) | `conda activate environment_name` |
| Deactivate an environment                | `source deactivate` or `deactivate` (Windows)        | `conda deactivate`                                 |
| List environments                        | N/A                                                  | `conda env list`                                   |
| Remove an environment                    | N/A                                                  | `conda env remove --name environment_name`         |

Please note that pip is the default package manager for Python, while conda is a cross-platform package manager specifically designed for data science and scientific computing.
