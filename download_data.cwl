# Automate model checking workflow
class: CommandLineTool
cwlVersion: v1.0
id: download_model_data
label: Download model data

baseCommand: ["hbp_download_data"]

requirements:
  - class: DockerRequirement
    dockerPull: docker-registry.ebrains.eu/ebrains-model-verification/ebrains-model-verification
                                                           
  # - class: InitialWorkDirRequirement 
  #   listing:
  #     - entry: $(inputs.report)
  #       writable: True

inputs:
  report:
    type: File
    inputBinding:
      position: 1
      prefix: --json
  outputs_link:
    type: 
      - string?
      - File?
    inputBinding:
      position: 2
      prefix: --outputs

outputs:
  report:
    type: File
    # format: json
    outputBinding:
      glob: data-report.json

  outputs_folder:
    type: Directory
    outputBinding:
      glob: outputs
    
  code_folder:
    type: Directory
    outputBinding:
      glob: code

  stderr_file: stderr
  stdout_file: stdout

stderr: stderr.txt
stdout: stdout.txt

s:identifier: https://kg.ebrains.eu/api/instances/34e4221a-c13d-4a02-b541-486cb567feb8
s:keywords: ["model data download"]
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