# Automate model checking workflow
class: CommandLineTool
cwlVersion: v1.0
id: verification_output_analysis
label: Output comparison verification method
$namespaces:
  sbg: 'https://www.sevenbridges.com/'

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
    
  code_folder:
    type: Directory

outputs: 
  output_comparison_report:
    type: File
    outputBinding:
      glob: file_compare_report.json


requirements:
    - class: InitialWorkDirRequirement
      listing:
      - entry: $(inputs.code_folder)
        writable: True
      - entry: $(inputs.outputs_folder)
        writable: True
      - entry: $(inputs.report)
        writable: False
    - class: DockerRequirement
      dockerPull: docker-registry.ebrains.eu/hbp-model-validation/docker-ebrains-base:esd
