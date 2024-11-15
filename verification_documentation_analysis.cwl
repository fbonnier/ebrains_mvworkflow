# Automate model checking workflow
class: CommandLineTool
cwlVersion: v1.0
id: verification_documentation_analysis
label: Documentation analysis
$namespaces:
  sbg: 'https://www.sevenbridges.com/'

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
      dockerPull: docker-registry.ebrains.eu/hbp-model-validation/docker-ebrains-base:esd
