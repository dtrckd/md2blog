
1. Format JSON:
   ```bash
   cat file.json | jq .
   ```

2. Extract values from JSON:
   ```bash
   cat file.json | jq '.key'
   ```

3. Filter JSON based on condition:
   ```bash
   cat file.json | jq 'select(.key == "value")'
   ```

4. Extract specific fields from JSON:
   ```bash
   cat file.json | jq '{ field1: .key1, field2: .key2 }'
   ```

5. Sort JSON array:
   ```bash
   cat file.json | jq 'sort_by(.key)'
   ```

6. Group JSON objects by a specific key:
   ```bash
   cat file.json | jq 'group_by(.key)'
   ```

7. Sum values in JSON array:
   ```bash
   cat file.json | jq 'map(.key) | add'
   ```

8. Update JSON values:
   ```bash
   cat file.json | jq '.key = "new value"'
   ```

9. Remove fields from JSON:
   ```bash
   cat file.json | jq 'del(.key)'
   ```

10. Pretty print JSON:
    ```bash
    cat file.json | jq -r .
    ```
