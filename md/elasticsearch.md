@elastisearch


Rename an elastisearch index.

```rename_es_index.sh
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

