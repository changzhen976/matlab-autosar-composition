# example Matlab project For AUTOSAR STRUCTURE

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
/Script
    ***.m
```
`StructureModel.slx` is the main Model which links all componet models


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
- [ ] : script operation
  - [x] : clean workspace
  - [ ] : import Enum, DataType & Interface...
