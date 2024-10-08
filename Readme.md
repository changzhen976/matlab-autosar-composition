# example Matlab project For AUTOSAR STRUCTURE

> ***This repo on GitHub.com is a mirror of my local repo which hosted in personal gitea server***

This project is used to learn how to generate AutoSar C-code and Arxml.

Model management based on git. ([Repository](http://thinkpad-lcz/gituser01/Matlab2023b-AutoSarStructure-test.git) hosted on gitea server running in Thinkpad WSL)

> matlab version: 2023b

## Folder Structrue :
```shell
/Model
    /composition_1
        /component_1
            comp_1_1.slx
        /component_2
            comp_1_2.slx
        ...
    /composition_2
    ...
    StructureModel.slx
    dictionary.sldd
/Harness
    harnessModel.slx
/Script
    ***.m
```
`StructureModel.slx` is the main Model which links all componet models

-----

## How to use

#### Use project

When open project(double click it OR pull it into cmd window), main ArchModel will be open;
needed folder path are included automaticly

When close project, `cleanWorkspace.m` run, delete cache files

#### Scripts

1. `cleanWorkspace.m` : delete folders named "\*_autosar_rtw"  "slprj", files named "\*.slxc" "\*.autosave"
2. `exCode.m` : export code into '/Models/release'

#### Harness

  Harness run will post error message, if arch model has 'DEM/Fim' or 'NvM' block. Move then from arch model to Harness model is ok.


------

## Task To Do :

- [x] : Create AutoSar model
- [x] : link componet models
- [x] : generate code & Arxml
- [ ] : sldd operation
  - [x] : new Enum Structrue
  - [ ] : import `AllEnum.sldd`
- [ ] : about RTE
- [ ] : about NvM
  - [ ] : block use
  - [ ] : code generate
- [ ] : about DEM/FiM
  - [x] : block use
  - [x] : code generate
- [x] : Harness
  - [x] : Harness Model test
- [ ] : script operation
  - [x] : clean workspace
  - [x] : export code
  - [ ] : import Enum, DataType & Interface...
  - [x] : add or delete 'Nvm'%'DEM/Fim' block for Harness model running
  - [ ] : auto connect comps ports(developing...)
