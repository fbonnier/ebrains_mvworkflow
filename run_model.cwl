# Automate model checking workflow
class: CommandLineTool
cwlVersion: v1.0
id: download_metadata
label: Run Model
$namespaces:
  sbg: 'https://www.sevenbridges.com/'

baseCommand: [sh]

inputs:
    runscript:
        type: File
        inputBinding:
            position: 1

    code_folder:
        type: Directory
            # inputBinding:
            #     position: 2

    outputs_folder:
        type: Directory
            # inputBinding:
            #     position: 3

    # jsonfile:
    #     type: File
    #     inputBinding:
    #         position: 2
    

outputs: 
    # runreport:
    #     type: File
    #     outputBinding:
    #       glob: runreport.json

    watchdog_report:
        type: File
        outputBinding:
            glob: watchdog_log.txt

    outputs_folder:
        type: Directory
        outputBinding:
            glob: "./outputs/"

    code_folder:
        type: Directory
        outputBinding:
            glob: "./code/"


requirements:
    - class: DockerRequirement
      # dockerPull: docker-registry.ebrains.eu/hbp-model-validation/docker-ebrains-base:esd
      # dockerPull: docker-registry.ebrains.eu/hbp-model-validation/docker-3b184b0c-d3b4-47f3-9d6d-4e18aff952ae
      # dockerPull: docker-registry.ebrains.eu/hbp-model-validation/docker-4fc81729-ae1e-4eb0-bc30-9b9f8afa7fa3
      dockerPull: docker-registry.ebrains.eu/hbp-model-validation/docker-fa393b61-92ab-4925-ad53-d36cde34c5d6

    - class: InitialWorkDirRequirement
      listing:
        - entry: $(inputs.code_folder)
          writable: true
        - entry: $(inputs.outputs_folder)
          writable: true
