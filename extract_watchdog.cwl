# Automate model checking workflow
class: CommandLineTool
cwlVersion: v1.0
id: extract_watchdog
label: Extract filenames from watchdog report to HBP JSON report
$namespaces:
  sbg: 'https://www.sevenbridges.com/'

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

  code_folder:
    type: Directory
    
  outputs_folder:
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
      - entry: $(inputs.code_folder)
        writable: true
      - entry: $(inputs.outputs_folder)
        writable: true
  - class: DockerRequirement
    dockerPull: docker-registry.ebrains.eu/hbp-model-validation/docker-ebrains-base:esd
