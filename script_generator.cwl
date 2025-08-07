# Automate model checking workflow
class: CommandLineTool
cwlVersion: v1.0
id: model_script_generator
label: Model script generator

  # - class: InitialWorkDirRequirement
  #   listing:
  #     -$(inputs.workdir)

  # 'sbg:license': CeCiLL
  # 'sbg:toolAuthor': Florent Bonnier
baseCommand: ["script_generator"]
requirements:
  - class: DockerRequirement
    dockerPull: docker-registry.ebrains.eu/ebrains-model-verification/ebrains-model-verification


inputs:
  jsonfile:
    type: File
    # format: json
    inputBinding:
        position: 1
        prefix: --json

    # Configuration JSON file to configure the computing machine
  machine_config:
    type: File?
    inputBinding:
      position: 2
      prefix: --machine

    # Configuration JSON file to configure the computing machine
  results_path:
    type: string?
    inputBinding:
      position: 3
      prefix: --outputdir

outputs: 
    runscript_bash:
        type: File
        # format: sh
        outputBinding:
          glob: run_me.sh
    
    # srunscript_bash:
    #     type: File
    #     # format: sh
    #     outputBinding:
    #       glob: srun_me.sh

    # runscript_cwl:
    #     type: File
    #     # format: cwl
    #     outputBinding:
    #       glob: run_me.cwl

    # input_yml:
    #     type: File
    #     # format: cwl
    #     outputBinding:
    #       glob: input_me.yml
    stderr_file: stderr
    stdout_file: stdout 

stderr: stderr.txt
stdout: stdout.txt


s:identifier: https://kg.ebrains.eu/api/instances/c105e323-1f6a-480b-9e9c-83fec2e1a300
s:keywords: ["model script generator"]
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