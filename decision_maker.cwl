# Automate model checking workflow
class: CommandLineTool
cwlVersion: v1.0
id: decision_maker
label: Decision Maker TODO
$namespaces:
  sbg: 'https://www.sevenbridges.com/'

baseCommand: ["decision_maker", "--out", "score_report.json"]

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

requirements: []
    # InitialWorkDirRequirement:
    #     listing:
    #         - entry: $(inputs.verification_output_analysis_report)
    #           writable: True