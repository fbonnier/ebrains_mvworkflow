# Automate model checking workflow
class: CommandLineTool
cwlVersion: v1.0
id: watchdog_extractor
label: Watchdog extractor
doc: Extract filenames from watchdog report to HBP JSON report
baseCommand: ["hbp_extract_watchdog"]

inputs:
  report:
    type: File
    # format: json
    inputBinding:
      position: 1
      prefix: --json

  watchdog_report:
    type: File
    # format: txt
    inputBinding:
      position: 2
      prefix: --watchdog

  # code_folder:
  #   type: Directory
    
  results_folder:
    type: Directory
          
outputs: 
  report:
    type: File
    outputBinding:
      glob: watchdog_report.json

requirements:                                                                   
  - class: InitialWorkDirRequirement 
    listing:
      - entry: $(inputs.report)
        writable: True
      # - entry: $(inputs.code_folder)
      #   writable: true
      - entry: $(inputs.results_folder)
        writable: true
  - class: DockerRequirement
    dockerPull: docker-registry.ebrains.eu/ebrains-model-verification/ebrains-model-verification


s:identifier: https://kg.ebrains.eu/api/instances/7f45cd96-3b26-4e7c-ae23-feb545f03fff
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