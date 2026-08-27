@python
@eval
@llm

## inspect-ai

CLI from the [inspect-ai](https://inspect.aisi.org.uk/) eval harness. Prefix with
`uv run` when it lives in a project venv.

### Discover

List tasks defined in a directory (`file.py@task_name`):

    inspect list tasks eval

List runs in the log dir (`--json`, `--log-dir DIR`):

    inspect log list

Version / paths:

    inspect info version

### Run

Evaluate a task (no LLM involved -> `mockllm/model`):

    inspect eval eval/task.py --model mockllm/model --limit 100 --max-samples 10

Resume a crashed/partial run:

    inspect eval-retry logs/<file>.eval

Re-score an existing log after changing the scorer (no re-run of the solver):

    inspect score logs/<file>.eval

### Read results

Header only = metadata + aggregate scores, without the per-sample payload:

    inspect log dump logs/<file>.eval --header-only

Terse score summary:

    inspect log dump logs/<f>.eval --header-only | jq '{status, n:.results.total_samples,
      scores:[.results.scores[]|{(.name): (.metrics|map_values(.value))}]}'

Last 3 runs, one line each (fish):

    for f in (ls -t logs/*.eval | head -3)
      inspect log dump $f --header-only | jq -c --arg f (basename $f) \
        '{f:$f, status, f1:.results.scores[0].metrics.f1.value}'
    end

Interactive viewer (per-sample inputs, scores, misses):

    inspect view
    inspect view --log-dir DIR --port 7575

Exact config of a past run (model, limits, task args):

    inspect log export-config logs/<file>.eval

`.eval` -> `.json` (diffable in git):

    inspect log convert --to json logs/

JSON schema of a log file:

    inspect log schema


Other log subcommands:

| Command | What |
| --- | --- |
| `inspect log dump F` | full log as JSON (samples included, can be huge) |
| `inspect log dump F --header-only` | config + results only |
| `inspect log export-config F` | the run configuration, to reproduce a run |
| `inspect log convert --to json F` | `.eval` -> `.json`, diffable in git |
| `inspect log schema` | JSON schema of the log format |
| `inspect log recover` | rebuild logs of a crashed run from the sample buffer |

### Misc

    inspect cache      # model output cache
    inspect trace      # execution traces of running/last evals
    inspect sandbox    # sandbox envs
    inspect eval-set   # run a set of tasks with retries
