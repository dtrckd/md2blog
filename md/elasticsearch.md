@elastisearch


Rename an elastisearch index.

```sh
#!/bin/bash

# Variables
OLD_INDEX_NAME="bareme-squeezed_norep_mushi-openai-v5"
NEW_INDEX_NAME="bareme-fr-2024-squeezed_norep_mushi-openai-v5"
ELASTICSEARCH_URL="http://localhost:9200"

# Retrieve settings and mappings from the old index
echo "Retrieving settings and mappings from $OLD_INDEX_NAME"
SETTINGS=$(curl -s -X GET "$ELASTICSEARCH_URL/$OLD_INDEX_NAME/_settings" | jq -r ".\"${OLD_INDEX_NAME}\".settings.index")
MAPPINGS=$(curl -s -X GET "$ELASTICSEARCH_URL/$OLD_INDEX_NAME/_mapping" | jq -r ".\"${OLD_INDEX_NAME}\".mappings")

# Create a new index with the same settings and mappings
echo "Creating new index: $NEW_INDEX_NAME with settings and mappings from $OLD_INDEX_NAME"
curl -X PUT "$ELASTICSEARCH_URL/$NEW_INDEX_NAME" -H 'Content-Type: application/json' -d "{
 \"settings\": $SETTINGS,
  \"mappings\": $MAPPINGS
}"

# Reindex data from the old index to the new index
echo "Reindexing data from $OLD_INDEX_NAME to $NEW_INDEX_NAME"
curl -X POST "$ELASTICSEARCH_URL/_reindex" -H 'Content-Type: application/json' -d "{
  \"source\": {
    \"index\": \"$OLD_INDEX_NAME\"
  },
  \"dest\": {
    \"index\": \"$NEW_INDEX_NAME\"
  }
}"

# Verify the data
echo "Verifying data in $NEW_INDEX_NAME"
curl -X GET "$ELASTICSEARCH_URL/$NEW_INDEX_NAME/_search?pretty"

# Delete the old index
echo "Deleting old index: $OLD_INDEX_NAME"
curl -X DELETE "$ELASTICSEARCH_URL/$OLD_INDEX_NAME"

echo "Index renaming completed."
```


---

## Elasticsearch Query Syntax Summary


Elasticsearch queries are constructed using JSON and organized into different clauses and query types to retrieve relevant documents from an index.

The `bool` query is a compound query that combines multiple conditions:

- **`must`**: Documents must match these conditions. Scoring is used to rank results.
- **`filter`**: Documents must match these conditions, but they do not affect scoring.
- **`must_not`**: Documents must not match these conditions. These are exclusion criteria.
- **`should`**: Documents matching these conditions increase their score. When `minimum_should_match` is set, a specified number or percentage of `should` conditions must be satisfied.

Example :

```json
{
  "query": {
    "bool": {
      "must": [...],
      "filter": [...],
      "must_not": [...],
      "should": [...],
      "minimum_should_match": 1
    }
  }
}
```

### Common Query Types

- **`match`**: Searches for documents with fields matching the text.
  ```json
  { "match": { "field_name": "text" } }
  ```

- **`multi_match`**: Searches across multiple fields.
  ```json
  {
    "multi_match": {
      "query": "text",
      "fields": ["field1", "field2"]
    }
  }
  ```

- **`term`**: Searches for documents with an exact match in a field.
  ```json
  { "term": { "field_name": "exact_value" } }
  ```

- **`terms`**: Searches for documents with any one of several specified values in a field.
  ```json
  { "terms": { "field_name": ["value1", "value2"] } }
  ```

- **`range`**: Searches within a specified field value range.
  ```json
  {
    "range": {
      "field_name": {
        "gte": 10,
        "lte": 20
      }
    }
  }
  ```

- **`exists`**: Finds documents where a field has any non-null value.
  ```json
  { "exists": { "field": "field_name" } }
  ```

- **`prefix`**: Searches for documents with terms starting with a prefix.
  ```json
  { "prefix": { "field_name": "prefix_value" } }
  ```

- **`wildcard`**: Searches using a wildcard pattern.
  ```json
  { "wildcard": { "field_name": "wi*ld" } }
  ```

- **`regexp`**: Searches using a regular expression.
  ```json
  { "regexp": { "field_name": "regex_pattern" } }
  ```

- **`fuzzy`**: Allows for a degree of fuzziness in matching (e.g., typos).
  ```json
  { "fuzzy": { "field_name": "fuzzy_value" } }
  ```

- **`match_phrase`**: Searches for exact phrases within a field.
  ```json
  { "match_phrase": { "field_name": "exact phrase" } }
  ```

### Usage Notes

- Queries can be nested and combined within the `bool` query to create complex search criteria.
- Adjust field names and values as needed to suit your specific Elasticsearch schema.
- Use the `filter` clause for non-scoring conditions, and leverage `must`, `should`, and `must_not` for scoring and logical operations in your search criteria.

This overview covers the essential building blocks for crafting Elasticsearch queries to retrieve and manipulate data effectively.


### Full example

```json
{
  "query": {
    "bool": {
      "must": [
        {
          "match": {
            "title": "Elasticsearch"
          }
        },
        {
          "range": {
            "publish_date": {
              "gte": "2020-01-01",
              "lte": "2023-12-31"
            }
          }
        }
      ],
      "must_not": [
        {
          "term": {
            "status": "draft"
          }
        }
      ],
      "filter": [
        {
          "term": {
            "category": "technology"
          }
        },
        {
          "range": {
            "views": {
              "gte": 1000
            }
          }
        }
      ]
    }
  }
}
