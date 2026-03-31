# HCSV - Hierarchical Comma Separated Value

Version: 1.0.0

## Overview

HCSV is a token-efficient, human-readable data format designed for AI agent consumption. It combines schema definitions with positional CSV-like data and supports hierarchical relationships without repeating foreign keys.

## Goals

- Minimise token usage for LLM consumption
- Remain human-readable
- Support hierarchical/relational data
- Be robust (no whitespace sensitivity beyond newlines)
- Simple to parse and serialise

## File Extension

`.hcsv`

## Structure

An HCSV document consists of:
1. Schema declarations
2. Data sections

```
@schema:entity = field1,field2,field3
@schema:>child = field1,field2

@data:entity
value1,value2,value3
>childvalue1,childvalue2
```

## Schema Declaration

```
@schema:NAME = FIELD1,FIELD2,FIELD3
```

- `NAME`: Entity type identifier (lowercase alphanumeric, hyphens, underscores)
- Fields: Comma-separated field names
- No spaces around `=` or after commas (optional, ignored if present)

### Child Schemas

```
@schema:>child = field1,field2
@schema:>>grandchild = field1
```

- `>` prefix indicates parent-child relationship
- Number of `>` indicates nesting depth
- Child belongs to the nearest preceding schema at depth - 1

### Schema Ordering

Schemas must be declared in hierarchical order:
```
@schema:parent = ...
@schema:>child = ...
@schema:>>grandchild = ...
@schema:>otherchild = ...
```

## Data Section

```
@data:ENTITY
```

Begins a data section for the named entity type. All subsequent lines are records until the next `@data:` or end of file.

### Records

```
value1,value2,value3
```

- Comma-separated values
- Position maps to schema field order
- One record per line

### Child Records

```
>value1,value2
>>value1
```

- `>` prefix indicates child of most recent parent at depth - 1
- Number of `>` matches schema nesting depth

### Example

```
@schema:department = id,name,budget
@schema:>team = name,members
@schema:>>member = name,role

@data:department
eng-001,Engineering,2500000
>Platform,12
>>Alice,Lead
>>Bob,Senior
>Frontend,8
>>Carol,Lead
ops-002,Operations,1200000
>Infrastructure,5
>>Dave,Lead
```

Parsed structure:
```
department[0]: {id: eng-001, name: Engineering, budget: 2500000}
  team[0]: {name: Platform, members: 12}
    member[0]: {name: Alice, role: Lead}
    member[1]: {name: Bob, role: Senior}
  team[1]: {name: Frontend, members: 8}
    member[0]: {name: Carol, role: Lead}
department[1]: {id: ops-002, name: Operations, budget: 1200000}
  team[0]: {name: Infrastructure, members: 5}
    member[0]: {name: Dave, role: Lead}
```

## Field Values

### Basic Types

| Type | Example | Notes |
|------|---------|-------|
| String | `hello world` | Unquoted unless contains special chars |
| Number | `42`, `-3.14`, `1.5e10` | Standard numeric notation |
| Boolean | `true`, `false` | Lowercase |
| Null | (empty) | Empty field between commas |
| Date | `2024-01-15` | ISO 8601 recommended |

### Arrays

Primitive arrays use semicolon delimiter:
```
Go;Kubernetes;Terraform
```

For arrays of objects, use child records instead.

### Special Characters

| Character | Handling |
|-----------|----------|
| Comma in value | Quote the field: `"hello, world"` |
| Quote in value | Double the quote: `"say ""hello"""` |
| Newline in value | Quote the field, preserve newline |
| Semicolon in value | Quote the field: `"a;b"` |
| Leading/trailing `>` | Quote the field: `">arrow"` |

### Empty vs Null

```
,value,        # First and third fields are null
"",value,""   # First and third fields are empty strings
```

## Multiple Entity Types

An HCSV document can contain multiple unrelated entity types:

```
@schema:user = id,name,email
@schema:product = sku,name,price

@data:user
u001,Alice,alice@example.com
u002,Bob,bob@example.com

@data:product
SKU001,Widget,29.99
SKU002,Gadget,49.99
```

## Comments

Lines starting with `#` are comments:
```
# This is a comment
@schema:entity = field1,field2

@data:entity
# Comment within data section
value1,value2
```

## Directives

### @default

Define default values for fields:
```
@schema:request = method,url,status,content_type
@default:request = GET,,200,application/json

@data:request
,/users,,           # GET /users 200 application/json
POST,/login,401,    # POST /login 401 application/json
,/products,,text/html  # GET /products 200 text/html
```

Empty field uses default. Explicit value overrides default.

### @base

Define base prefix for a field:
```
@schema:request = method,url,status
@base:request.url = https://api.example.com

@data:request
GET,/users,200      # url expands to https://api.example.com/users
GET,/products,200
```

## MIME Type

`application/hcsv`

## Design Rationale

### Why not JSON?
JSON repeats keys for every record. For 1000 records with 10 fields, JSON transmits field names 10,000 times. HCSV transmits them once.

### Why not YAML?
YAML is whitespace-sensitive and fragile. A single indentation error breaks the document.

### Why not CSV?
CSV lacks:
- Schema definitions
- Hierarchical relationships
- Multiple entity types
- Standardised type handling

HCSV extends CSV concepts with schemas and hierarchy.

### Why not a binary format?
Binary formats require decoding before an LLM can process them. HCSV is directly readable by both humans and AI agents.

## Parsing Algorithm

```
function parse(input):
    schemas = {}
    data = {}
    current_entity = null
    parent_stack = []

    for line in input.lines():
        line = line.trim()

        if line.empty() or line.starts_with("#"):
            continue

        if line.starts_with("@schema:"):
            depth = count_leading(line[8:], ">")
            rest = line[8 + depth:]
            name, fields = rest.split("=")
            schemas[name.trim()] = {
                depth: depth,
                fields: fields.split(",").map(trim),
                parent: find_parent(schemas, depth)
            }

        elif line.starts_with("@default:"):
            name, values = line[9:].split("=")
            schemas[name.trim()].defaults = parse_csv(values)

        elif line.starts_with("@base:"):
            target, value = line[6:].split("=")
            entity, field = target.split(".")
            schemas[entity.trim()].bases[field.trim()] = value.trim()

        elif line.starts_with("@data:"):
            current_entity = line[6:].trim()
            if current_entity not in data:
                data[current_entity] = []
            parent_stack = []

        else:
            depth = count_leading(line, ">")
            values = parse_csv(line[depth:])
            schema = find_schema_at_depth(schemas, current_entity, depth)
            record = apply_schema(schema, values)

            if depth == 0:
                data[current_entity].append(record)
                parent_stack = [record]
            else:
                parent = parent_stack[depth - 1]
                child_key = schema.name + "s"  # pluralise
                parent[child_key] = parent[child_key] or []
                parent[child_key].append(record)
                parent_stack = parent_stack[:depth]
                parent_stack.append(record)

    return data
```

## Serialisation Algorithm

```
function serialise(data, schemas):
    output = []

    # Write schemas
    for schema in schemas.sorted_by_depth():
        prefix = ">" * schema.depth
        output.append("@schema:" + prefix + schema.name + "=" + schema.fields.join(","))

    # Write defaults
    for schema in schemas:
        if schema.defaults:
            output.append("@default:" + schema.name + "=" + schema.defaults.join(","))

    output.append("")

    # Write data
    for entity, records in data:
        output.append("@data:" + entity)
        for record in records:
            output.append(serialise_record(record, schemas, 0))

    return output.join("\n")

function serialise_record(record, schemas, depth):
    lines = []
    schema = schemas[record.type]
    prefix = ">" * depth
    values = schema.fields.map(f => escape(record[f]))
    lines.append(prefix + values.join(","))

    for child_schema in schema.children:
        child_key = child_schema.name + "s"
        for child in record[child_key]:
            lines.append(serialise_record(child, schemas, depth + 1))

    return lines.join("\n")
```

## Complete Example

```
# Organisation data export
# Generated: 2024-01-15

@schema:organisation = name,founded,active,city,country
@schema:>department = id,name,budget,headcount,manager_name,manager_email
@schema:>>team = name,members,technologies

@default:organisation = ,,true,,
@default:department = ,,0,0,,

@data:organisation
Acme Corporation,1985,true,Brisbane,Australia
>eng-001,Engineering,2500000,45,Sarah Chen,sarah.chen@acme.com
>>Platform,12,Go;Kubernetes;Terraform
>>Frontend,8,TypeScript;React;Next.js
>>Data,10,Python;Spark;BigQuery
>ops-002,Operations,1200000,20,Marcus Webb,marcus.webb@acme.com
>>Infrastructure,8,AWS;GCP;Ansible
>>Security,6,Vault;SIEM;IAM
```

## Comparison

| Format | Repeated Keys | Hierarchy | Robust | Human Readable | Token Efficient |
|--------|---------------|-----------|--------|----------------|-----------------|
| JSON | Yes | Native | Yes | Medium | Low |
| YAML | Yes | Native | No | High | Medium |
| CSV | No | No | Yes | High | High |
| TOML | Yes | Sections | Yes | High | Medium |
| HCSV | No | Yes | Yes | High | High |


