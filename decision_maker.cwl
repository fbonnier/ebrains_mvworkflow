# Automate model checking workflow
class: CommandLineTool
cwlVersion: v1.0
id: decision_maker
label: Decision Maker

baseCommand: ["decision_maker", "--out", "score_report.json"]
requirements:
  - class: DockerRequirement
    dockerPull: docker-registry.ebrains.eu/ebrains-model-verification/ebrains-model-verification

inputs:
  report_list:
    type: File[]
    inputBinding:
      position: 1
      prefix: --json
      separate: true
  # score_documentation_analysis:
  #   type: File
  #   inputBinding:
  #     position: 2

outputs: 
    decision_report:
        type: File
        outputBinding:
          glob: score_report.json

# requirements: []
    # InitialWorkDirRequirement:
    #     listing:
    #         - entry: $(inputs.verification_output_analysis_report)
    #           writable: True


s:identifier: https://kg.ebrains.eu/api/instances/f8300f8f-ac19-4396-bcd9-f31cdb3c1247
s:keywords: ["watchdog extractor"]
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