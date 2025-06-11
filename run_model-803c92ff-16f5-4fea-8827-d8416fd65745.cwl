# Automate model checking workflow
class: CommandLineTool
cwlVersion: v1.2
id: download_metadata
label: Run Model
$namespaces:
  sbg: 'https://www.sevenbridges.com/'

baseCommand: [/bin/sh]

inputs:
    runscript:
        type: File
        inputBinding:
            position: 1

    # code_folder:
    #     type: Directory
    #         # inputBinding:
    #         #     position: 2

    # results_path:
    #     type: string?
            # inputBinding:
            #     position: 3

outputs: 

    watchdog_report:
        type: File
        outputBinding:
            glob: watchdog_log.txt

    results_folder:
        type: Directory
        outputBinding:
            glob: res_outputs

    # code_folder:
    #     type: Directory
    #     outputBinding:
    #         glob: code

    output_stdout: stdout
    output_stderr: stderr

stdout: run_stdout.txt
stderr: run_stderr.txt

requirements:
    - class: DockerRequirement 
      dockerPull: docker-registry.ebrains.eu/ebrains-model-verification/803c92ff-16f5-4fea-8827-d8416fd65745:nest

    # - class: InitialWorkDirRequirement
    #   listing:
    #     - entry: $(inputs.results_folder)
    #       writable: true

    - class: NetworkAccess
      networkAccess: true
