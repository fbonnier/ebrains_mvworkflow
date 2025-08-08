# Automate model checking workflow
class: CommandLineTool
cwlVersion: v1.1
id: run_model
label: Run Model

baseCommand: [sh]


# stdout: run_stdout.txt
# stderr: run_stderr.txt

inputs:
    runscript:
        type: File
        inputBinding:
            position: 1

    # code_folder:
    #     type: Directory
    #         # inputBinding:
    #         #     position: 2

    # outputs_folder:
    #     type: Directory
    #         # inputBinding:
    #         #     position: 3
    

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

#     output_stdout: stdout
#     output_stderr: stderr

# stdout: run_stdout.txt
# stderr: run_stderr.txt

    # output_stdout:
    #     type: stdout

    # output_stderr:
    #     type: stderr

requirements:
    - class: DockerRequirement 
      dockerPull: docker-registry.ebrains.eu/ebrains-model-verification/ebrains-model-verificatio

    - class: NetworkAccess
      networkAccess: true
