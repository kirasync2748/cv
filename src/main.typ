#import "cv-template.typ": *

#show: document.with(
  name: "Your Name",
  role: "Software Engineer — Distributed Systems & Open Source",
  contact: (
    "Your City, Country",
    "+1 555 000 0000",
    "your.email@example.com",
    "your-github",
    "your-linkedin",
  ),
  sidebar: [
    #category("Skills")
    #skill-group("Languages", "Go, Rust, Python, TypeScript, C, Haskell")
    #skill-group("Infrastructure", "Docker, Kubernetes, Terraform, Nix, Nomad")
    #skill-group("Cloud", "AWS, GCP, Cloudflare Workers")
    #skill-group("Databases", "PostgreSQL, Redis, Cassandra, SQLite")
    #skill-group("Observability", "Prometheus, Grafana, OpenTelemetry")
    #v(8pt)

    #category("Languages")
    #simple-entry(label: "English", value: "Native")
    #simple-entry(label: "French", value: "Fluent — CEFR C1")
    #simple-entry(label: "Spanish", value: "Intermediate — CEFR B2")
    #simple-entry(label: "German", value: "Conversational — CEFR B1")
    #v(8pt)

    #category("Awards")
    #simple-entry(label: "Dean's List", value: "Bristol (2021, 2022)")
    #simple-entry(label: "Google Step", value: "Internship Award (2022)")
    #simple-entry(label: "Bristol Tech Hack", value: "Best Project (2021)")
    #simple-entry(label: "ACM ICPC", value: "Regional Finalist (2022)")
    #simple-entry(label: "BIO", value: "Finalist (2019)")
    #v(8pt)

    #category("Interests")
    #simple-entry(value: "Open-source contribution")
    #simple-entry(value: "Hill walking & Munro bagging")
    #simple-entry(value: "Classical guitar")
    #simple-entry(value: "Competitive chess (ECF rated)")
  ],
)

#category("Experience")

#position(
  title: "Senior Software Engineer",
  organisation: "Fastly",
  dates: "2023 — Present",
  location: "London",
  details: [
    - Building edge compute platform handling 40M+ requests per second
    - Led migration of internal tooling from Python to Go, reducing latency by 60%
    - Mentor for two graduate engineers
  ],
)

#position(
  title: "Software Engineering Intern",
  organisation: "Anthropic",
  dates: "2022 — 2023",
  location: "London",
  details: [
    - Developed distributed training pipeline for large language models
    - Optimised data loading, reducing training time by 35%
    - Presented findings to team of 20+ researchers
  ],
)

#position(
  title: "Research Assistant",
  organisation: "University of Bristol",
  dates: "2021 — 2022",
  location: "Bristol",
  details: [
    - Investigated Byzantine fault-tolerant consensus algorithms
    - Co-authored paper published at OPODIS 2022
    - Implemented prototype in Rust
  ],
)

#position(
  title: "Teaching Assistant",
  organisation: "University of Bristol",
  dates: "2020 — 2021",
  location: "Bristol",
  details: [
    - Data Structures & Algorithms course (200+ students)
    - Held weekly tutorials and marked coursework
    - Received 4.8/5 student satisfaction rating
  ],
)

#category("Education")

#position(
  title: "MEng Computer Science",
  organisation: "University of Bristol",
  dates: "2019 — 2023",
  location: "First Class Honours",
  details: [
    - Thesis: "Byzantine Fault Tolerance in Peer-to-Peer Networks"
    - Dean's List 2021 and 2022
  ],
)

#position(
  title: "A-Levels",
  organisation: "Clifton College",
  dates: "2013 — 2019",
  location: "Bristol",
  details: [
    - Mathematics A\*, Further Mathematics A\*, Physics A\*, Chemistry A
  ],
)

#category("Projects")

#position(
  title: "Tempest",
  organisation: "your-github/your-project",
  dates: "2022 — Present",
  details: [
    - Distributed task scheduler in Rust — 2,400+ stars on GitHub
    - Used by three companies in their internal infrastructure
    - Featured in Rust Community Spotlight
  ],
)

#position(
  title: "Beacon",
  organisation: "your-github/your-project",
  dates: "2021 — Present",
  details: [
    - Static site generator with live preview, written in Go
    - Zero external dependencies; builds sites in under 100ms
    - 800+ stars on GitHub
  ],
)

#position(
  title: "Prism",
  organisation: "your-github/your-project",
  dates: "2020 — Present",
  details: [
    - Terminal-based colour palette generator
    - Extracts dominant colours from images; outputs CSS, JSON, ANSI
    - 300+ stars on GitHub
  ],
)
