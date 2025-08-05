# Automate model checking workflow
class: CommandLineTool
cwlVersion: v1.0
id: ebrains_download_metadata
label: EBRAINS Download Metadata

# requirements: []
  # - class: InitialWorkDirRequirement
  #   listing:
  #     -$(inputs.workdir)
requirements:
  - class: DockerRequirement
    dockerPull: docker-registry.ebrains.eu/ebrains-model-verification/ebrains-model-verification


  # 'sbg:license': CeCiLL
  # 'sbg:toolAuthor': Florent Bonnier
baseCommand: ["hbp_cwl_input_downloader"]

inputs:
  hbp_token:
    type: string
    inputBinding:
        position: 1
        prefix: --token

  hbp_user:
    type: string
    inputBinding:
        position: 1
        prefix: --username

  hbp_password:
    type: string
    inputBinding:
        position: 1
        prefix: --password

  model_instance_id:
    type: string
    inputBinding:
        position: 2
        prefix: --id

  # workdir: 
  #   type: string
  #   inputBinding:
  #       position: 3
  #       prefix: 

  instruction: 
    type: string
    inputBinding:
      position: 3
      prefix: --run

  pre_instructions: 
    type: string
    inputBinding:
      position: 4
      prefix: --pre-run
    # dirname: workdir
    # basename:

  # outputs_link:
  #   type: 
  #     - string?
  #     - File?
  #   inputBinding:
  #     position: 5
  #     prefix: --outputs
  
  # output_archive:
  #   type: File[]?
  #   inputBinding:
  #     position: 6
  #     prefix: --archive

outputs: 
    report:
        type: File
        # format: json
        outputBinding:
          glob: metadata-report.json
    stderr_file: stderr
    stdout_file: stdout

stderr: stderr.txt
stdout: stdout.txt

s:identifier: https://kg.ebrains.eu/api/instances/0c35cf26-8f91-448e-b531-69b899651e21
s:keywords: ["model metadata download"]
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