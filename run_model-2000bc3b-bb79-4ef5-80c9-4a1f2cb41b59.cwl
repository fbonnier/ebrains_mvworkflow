# Automate model checking workflow
class: CommandLineTool
cwlVersion: v1.2
id: download_metadata
label: Run Model
$namespaces:
  sbg: 'https://www.sevenbridges.com/'

baseCommand: [sh]


# stdout: run_stdout.txt
# stderr: run_stderr.txt

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

    # output_stdout:
    #     type: stdout

    # output_stderr:
    #     type: stderr

requirements:
    - class: DockerRequirement
      dockerPull: docker-registry.ebrains.eu/hbp-model-validation/docker-2000bc3b-bb79-4ef5-80c9-4a1f2cb41b59 # read access to /opt/data  

    - class: InitialWorkDirRequirement
      listing:
        - entry: $(inputs.code_folder)
          writable: true
        - entry: $(inputs.outputs_folder)
          writable: true

    - class: NetworkAccess
      networkAccess: true
