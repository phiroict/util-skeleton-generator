# Utility {{ UTILNAME }}
# Preface 
  > description of the code on a high level 


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
│   └── {{ UTILNAME }}.sh
└── test
```

| Dirname        | description                                                                                                                                          |
|----------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| adr            | A placeholder for the Architectural Descision process<br/> if your machine does not have the adrtools installed there will be nothing in this folder |
| infra          | Optional the code needed for deployment and creation of (cloud) platform resources <br/> needed for running the script. |                             
| init           | Prerequesits of the script go here (libraries needed, preparation of the OS, etc. | 
| init/resources | A list of all ancilallry files that are installed for the tool, <br/> the directory structure will follow the installation, for instance, readme.md in the root will end up in the root of the project|
| src | The actual source of the script| 
| test | Test scripts or test documentation not in the readme.md or the wiki | 

# Code function 

Call by 

```bash

```

Example 
```bash

```
> description of the code on a detailed level

## PARAMS

| Param name | Desc | Optional                   | 
| --- | --- |----------------------------| 

### ENV

| ENv name                      | Desc                                 | Optional/Default                                         | 
|-------------------------------|--------------------------------------|----------------------------------------------------------|
