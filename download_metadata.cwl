# Automate model checking workflow
class: CommandLineTool
cwlVersion: v1.0
id: download_metadata
label: Download Metadata TODO
$namespaces:
  sbg: 'https://www.sevenbridges.com/'

# requirements: []
  # - class: InitialWorkDirRequirement
  #   listing:
  #     -$(inputs.workdir)
requirements:
  - class: DockerRequirement
    dockerPull: docker-registry.ebrains.eu/hbp-model-validation/docker-ebrains-base:esd


  # 'sbg:license': CeCiLL
  # 'sbg:toolAuthor': Florent Bonnier
baseCommand: ["hbp_cwl_input_downloader"]

inputs:
  # hbp_token:
  #   type: string
  #   inputBinding:
  #       position: 1
  #       prefix: --token

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
    

outputs: 
    report:
        type: File
        # format: json
        outputBinding:
          glob: metadata-report.json