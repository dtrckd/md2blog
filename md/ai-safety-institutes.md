@ai
@eval
@governance


## Inspect (UK AISI eval framework)

De facto standard across govt AI institutes. Docs: https://inspect.aisi.org.uk/

    pip install inspect-ai
    inspect eval mytask.py --model openai/gpt-4o

UK AISI org: https://github.com/UKGovernmentBEIS

| Repo | What |
|---|---|
| `UKGovernmentBEIS/inspect_ai` | Core eval framework (MIT) |
| `UKGovernmentBEIS/inspect_evals` | Community eval suite for Inspect |
| `UKGovernmentBEIS/control-arena` | AI control / sabotage eval settings |
| `UKGovernmentBEIS/inspect_k8s_sandbox` | k8s sandbox provider (also `_ec2_`, `_proxmox_`) |
| `UKGovernmentBEIS/sandbox_escape_bench` | Sandbox escape benchmark |
| `UKGovernmentBEIS/hibayes` | Bayesian analysis of eval results |

Adjacent govt tools:

- AI Verify (Singapore) — governance/testing toolkit: https://github.com/aiverify-foundation/aiverify
- Moonshot (Singapore) — LLM eval/red-teaming toolkit: https://github.com/aiverify-foundation/moonshot
- Dioptra (NIST/US) — adversarial robustness testbed: https://github.com/usnistgov/dioptra


## AI safety / evaluation institutes by country

| Country/Region | Institute | Est. | Parent body | Site | Forge |
|---|---|---|---|---|---|
| UK | AI Security Institute (ex-AI Safety Institute) | Nov 2023, renamed Feb 2025 | DSIT | https://www.aisi.gov.uk/ | https://github.com/UKGovernmentBEIS |
| US | Center for AI Standards and Innovation (CAISI, ex-US AISI) | Nov 2023, renamed Jun 2025 | NIST / Commerce | https://www.nist.gov/caisi | https://github.com/usnistgov |
| EU | EU AI Office / AI Safety Unit | 2024 | European Commission | https://digital-strategy.ec.europa.eu/en/policies/ai-office | — |
| Japan | Japan AI Safety Institute (J-AISI) | Feb 2024 | IPA | https://aisi.go.jp/ | — |
| Singapore | Digital Trust Centre → Singapore AISI | 2022, renamed May 2024 | NTU + IMDA | https://www.ntu.edu.sg/dtc , https://aiverifyfoundation.sg/ | https://github.com/aiverify-foundation |
| South Korea | AI Safety Institute (인공지능안전연구소) | Nov 2024 | ETRI / MSIT | https://aisi.re.kr/ | — |
| Canada | Canadian AI Safety Institute (CAISI) | Nov 2024 | ISED + NRC + CIFAR | https://ised-isde.canada.ca/site/ised/en/canadian-artificial-intelligence-safety-institute | — |
| France | INESIA | Jan 2025 | LNE + Inria | https://www.lne.fr/ , https://www.inria.fr/ | — |
| China | China AI Development and Safety Network | Sep 2024 | State-affiliated | (no stable public site found) | — |
| Poland | AI Safety Research Centre | Nov 2024 | NASK | (not verified) | — |
| Argentina | AI Unit for Security (UIAAS) | Jul 2024 | — | (not verified) | — |
| Kenya | Network member | Sep 2024 | — | — | — |
| Australia / Germany / Italy | Signatories, no standalone institute | May 2024 | — | — | — |

Notes: Korea AISI = 3 divisions (policy/intl, evaluation, research), Bundang. Canada CAISI funds research via CIFAR.
Japan J-AISI ~23 staff, publishes eval guides (`AIセーフティに関する評価観点ガイド`).


## International Network of AI Safety Institutes

Launched Nov 21-22 2024, San Francisco; follows May 2024 Seoul Statement of Intent. US chairs.
Founding members: US, UK, EU, Japan, Singapore, South Korea, Canada, France, Kenya, Australia.
First joint testing exercise: US + UK + Singapore AISIs.


## Caveats

- UK and US renames both moved away from "safety" framing (security / standards).
- Signatory != institute; Australia/Germany/Italy had none announced.
- Only UK, US and Singapore publish real open-source eval code; others ship PDFs/guidelines.
- Links marked "not verified" were not reachable when checked; France has no dedicated INESIA domain.
- Sources: aisi.gov.uk, NIST fact sheet, CSIS, Wikipedia "AI safety institute", Global Index for AI Safety.
