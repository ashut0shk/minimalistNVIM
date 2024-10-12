---
-- @file lua/internal_plugins/snippets/python.lua
--
-- @brief
-- The collection of snippets for python files
--
-- @author Rezha Adrian Tanuharja
-- @date 2024-10-05
--


return {

  -- a main function
  {
    trigger = 'main',
    body = 'function main() {\n\t$0\n}\n\nmain();',
    preview = '**function** main() {\n\tactions\n}\n\nmain();',
  },

  -- import statement
  {
    trigger = 'import',
    body = 'import { ${2:object} } from \'${1:module}\';\n$0',
    preview = '**import** { object } **from** \'module\';',
  },

  -- a function definition
  {
    trigger = 'func',
    body = 'function ${1:function_name}(${2:args}) {\n\t${3:// body}\n$0\n}',
    preview = '**function** `function_name`(args) {\n\t// body\n}',
  },

  -- a class definition
  {
    trigger = 'class',
    body = 'class ${1:class_name} {\n\n\tconstructor(${2:args}) {\n\t\t${3:// constructor body}\n\t}\n$0\n}',
    preview = '**class** `class_name` {\n\t**constructor**(args) {\n\t\t// constructor body\n\t}\n}',
  },

  -- extending a class
  {
    trigger = 'extends',
    body = 'class ${1:class_name} extends ${2:ParentClass} {\n\n\tconstructor(${3:args}) {\n\t\tsuper(${3:args});\n\t\t${4:// constructor body}\n\t}\n$0\n}',
    preview = '**class** `class_name` **extends** `ParentClass` {\n\t**constructor**(args) {\n\t\t**super**(args);\n\t\t// constructor body\n\t}\n}',
  },

  -- console.log with timestamp
  {
    trigger = 'logts',
    body = 'console.log(`[${new Date().toISOString()}]`, ${1:message});\n$0',
    preview = 'console.log(`[${new Date().toISOString()}]`, message);',
  },

  -- console.log with JSON.stringify
  {
    trigger = 'logjson',
    body = 'console.log(JSON.stringify(${1:obj}, null, 2));\n$0',
    preview = 'console.log(JSON.stringify(obj, null, 2));',
  },

  -- for loop
  {
    trigger = 'for',
    body = 'for (let ${1:i} = 0; ${1:i} < ${2:array}.length; ${1:i}++) {\n\t${3:// loop body}\n$0\n}',
    preview = 'for (let i = 0; i < array.length; i++) {\n\t// loop body\n}',
  },

  -- forEach loop
  {
    trigger = 'foreach',
    body = '${1:array}.forEach((${2:item}, ${3:index}) => {\n\t${4:// loop body}\n$0\n});',
    preview = 'array.forEach((item, index) => {\n\t// loop body\n});',
  },

  -- async function
  {
    trigger = 'async',
    body = 'async function ${1:function_name}(${2:args}) {\n\t${3:// body}\n$0\n}',
    preview = '**async function** `function_name`(args) {\n\t// body\n}',
  },

  -- try-catch block
  {
    trigger = 'trycatch',
    body = 'try {\n\t${1:// try block}\n} catch (${2:error}) {\n\tconsole.error(${2:error});\n$0\n}',
    preview = '**try** {\n\t// try block\n} **catch** (error) {\n\tconsole.error(error);\n}',
  },

}



