# Automate model checking workflow
class: CommandLineTool
cwlVersion: v1.0
id: verification_output_analysis
label: Output comparison verification method

baseCommand: ["file_compare"]

inputs:
  report:
    type: File
    # format: json
    inputBinding:
      position: 1
      prefix: --json

  outputs_folder:
    type: Directory
    
  results_folder:
    type: Directory

outputs: 
  output_comparison_report:
    type: File
    outputBinding:
      glob: file_compare_report.json


requirements:
    - class: InitialWorkDirRequirement
      listing:
      - entry: $(inputs.results_folder)
        writable: True
      - entry: $(inputs.outputs_folder)
        writable: True
      - entry: $(inputs.report)
        writable: False
    - class: DockerRequirement
      dockerPull: docker-registry.ebrains.eu/ebrains-model-verification/ebrains-model-verification

s:identifier: https://kg.ebrains.eu/api/instances/fc4d7758-9e23-47c7-a0f6-58309c61350c
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
