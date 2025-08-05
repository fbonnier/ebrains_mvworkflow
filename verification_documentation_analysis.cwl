# Automate model checking workflow
class: CommandLineTool
cwlVersion: v1.0
id: verification_documentation_analysis
label: Verification Documentation analysis

baseCommand: ["documentation_check", "--out", "documentation_report.json"]

inputs:
  report:
    type: File
    # format: json
    inputBinding:
      position: 1
      prefix: --json
  code_folder:
    type: Directory
    inputBinding:
      position: 2
      prefix: --repository

outputs: 
  documentation_report:
    type: File
    outputBinding:
      glob: documentation_report.json

requirements:
    - class: InitialWorkDirRequirement
      listing:
      - entry: $(inputs.code_folder)
        writable: True
      - entry: $(inputs.report)
        writable: False
    - class: DockerRequirement
      dockerPull: docker-registry.ebrains.eu/ebrains-model-verification/ebrains-model-verification

s:identifier: https://kg.ebrains.eu/api/instances/0c35cf26-8f91-448e-b531-69b899651e21
s:keywords: ["data analysis"]
s:author:
  - class: s:Person
    s:name: Bonnier Florent
s:codeRepository: https://github.com/fbonnier/ebrains_mvworkflow
s:version: "1.0"
s:dateCreated: "2025-08-5"
s:programmingLanguage: Python

$namespaces:
 s: https://schema.org/

$schemas:
 - https://schema.org/version/latest/schemaorg-current-http.rdf
