# Utility Generate-project
# Preface
> This is a standardized structure generator for utilities. It itself is structured in the same way so it 
> becomes very meta quickly. 
> 
> It will contain a structure for tests, sourcecode, infrastructure provision if needed, documentation and 
> architectural decision records (ADR)  (if adrtools are installed it will generate the structure for it as well else it will be 
> just create the directory)

# Information block 

| Code info        |               |
|------------------|---------------|
| Ownership        | Platform Team | 
| Type             | Bash          | 
| State            | Development   |
| Template version | 0.1.0         |


# Generated structure

```text
.
├── adr
    ├── doc
│       └── adr
│          ├── 0001-record-architecture-decisions.md
├── infra
├── init
│   ├── initialize-linux-arch.sh
│   ├── initialize-macos_arm.sh
│   └── resources
├── src
│   └── generate-project.sh
└── test
```

| Dirname        | description                                                                                                                                                                                            |
|----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| adr            | A placeholder for the Architectural Descision process<br/> if your machine does not have the adrtools installed there will be nothing in this folder                                                   |
| infra          | Optional the code needed for deployment and creation of (cloud) platform resources <br/> needed for running the script.                                                                                |                             
| init           | Prerequesits of the script go here (libraries needed, preparation of the OS, etc.                                                                                                                      | 
| init/resources | A list of all ancilallry files that are installed for the tool, <br/> the directory structure will follow the installation, for instance, readme.md in the root will end up in the root of the project |
| src            | The actual source of the script                                                                                                                                                                        | 
| test           | Test scripts or test documentation not in the readme.md or the wiki                                                                                                                                    | 

# Code usage

## Direct
The utility is called by
```bash
cd src
bash ./generate-project.sh <utility_name> <utility_type> <test_result?> <output_dir>

# For instance   
bash ./generate-project.sh "generate-utility" "bash" "true" "/tmp"
```

## Through builder container. 

This will use docker to run the script so no tools need to be installed on the system. 
Run from `make` or copy the command from the make file. 

```bash
make rerun_container
```
Note you can set version and name of the utilities in the top two lines of the make file.
You can copy the lines as well but note you need to replace $() values with the ones you want. 



## Params 

| Name         | Desc                                                                        | Optional |
|--------------|-----------------------------------------------------------------------------|----------|
| util_name    | Name of the utility, will be placed in all docs as well, defaults to 'UTIL' | Yes      |
| util_type    | One of {'bash','python','terraform','ansible'}, defaults to 'bash'          | Yes      |
| test_result? | Execute tests (if any), defaults to 'true'                                  | Yes      |
| output_dir   | Where the source will be written to, defaults to current dir                | Yes      |


 ## Output

- The generated utility skeleton project on the output_dir or the current dir.
- A tree view of the generated source 
- A test report if tests are present and selected to run. 


 