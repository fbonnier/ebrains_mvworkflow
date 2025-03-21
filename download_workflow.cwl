# Automate model download workflow
class: Workflow
cwlVersion: v1.2
id: model_verification_download
label: Metadata and Data download from EBRAINS
$namespaces:
  sbg: 'https://www.sevenbridges.com/'

inputs:
  # hbp_token: string
  hbp_user: string?

  hbp_password: string?

  hbp_token: string?

  model_instance_id: string

  instruction: string

  pre_instructions: string?

  machine: string?

requirements:
  - class: InlineJavascriptRequirement
  - class: MultipleInputFeatureRequirement
  # 'sbg:license': CeCiLL
  # 'sbg:toolAuthor': Florent Bonnier

outputs:
  metadata-report:
    type: File
    outputSource: download_metadata/report
  data-report:
    type: File
    outputSource: download_data/report #code_folder, outputs_folder

  outputs_folder:
    type: Directory
    outputSource: download_data/outputs_folder

  code_folder:
    type: Directory
    outputSource: download_data/code_folder

  # run_stderr:
  #   type: File
  #   outputSource: run_model/output_stderr
  # run_stdout:
  #   type: File
  #   outputSource: run_model/output_stdout


steps:

# Download workflow and meta
# JSON File contains metadata and is localized in {workdir}, a.k.a {self.path/..}
  download_metadata: 
    run: download_metadata.cwl
    in:
      # hbp_token: hbp_token
      hbp_user: hbp_user
      hbp_password: hbp_password
      model_instance_id: model_instance_id
      instruction: instruction
      pre_instructions: pre_instructions
      
    out: [report]

    label: Download Metadata

# Download data
# Download code, inputs, documentation
  download_data: 
    run: download_data.cwl
    in:
      report: download_metadata/report
      
    out: [report, code_folder, outputs_folder]

    label: Download Data

# Generate software's script
# Machine specific in order to be able to send the script to compute node
  script_generator:
    run: script_generator.cwl
    in:
      report: download_data/report
      machine: machine
    out:
