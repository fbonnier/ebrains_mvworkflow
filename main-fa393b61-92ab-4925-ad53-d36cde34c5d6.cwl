# Automate model checking workflow
class: Workflow
cwlVersion: v1.2
id: model_verification_fa393b61-92ab-4925-ad53-d36cde34c5d6
label: Model Verification fa393b61-92ab-4925-ad53-d36cde34c5d6

inputs:
  # hbp_token: string
  hbp_user: string?

  hbp_password: string?

  hbp_token: string?

  model_instance_id: string

  instruction: string

  pre_instructions: string?

  outputs_link:
    - string?
    - File?

  machine_configuration_file: File?

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

  runscript-generator:
    type: File
    outputSource: script_generator/runscript_bash

  watchdog-report-full:
    type: File
    outputSource: run_model/watchdog_report

  watchdog-report:
    type: File
    outputSource: extract_watchdog/report

  verification-documentation-report:
    type: File
    outputSource: verification_documentation_analysis/documentation_report

  verification-reusability-report:
    type: File
    outputSource: verification_output_analysis/output_comparison_report

  decision-report:
    type: File
    outputSource: decision_maker/decision_report

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
      hbp_token: hbp_token
      hbp_user: hbp_user
      hbp_password: hbp_password
      model_instance_id: model_instance_id
      instruction: instruction
      pre_instructions: pre_instructions
      outputs_link: outputs_link
      
    out: [report]

    label: Download Metadata

# Download data
# Download code, inputs, documentation
  download_data: 
    run: download_data.cwl
    in:
      report: download_metadata/report
      outputs_link: outputs_link
      
    out: [report, code_folder, outputs_folder]

    label: Download Data

# Generates script if available
  script_generator:
    run: script_generator.cwl
    in:
      jsonfile: download_data/report
      machine_config: machine_configuration_file

    out: [runscript_bash]
    label: Generates runscript

# Run the model if script has been generated
  run_model:
    # run: run_model-fa393b61-92ab-4925-ad53-d36cde34c5d6.cwl
    run: run_model.cwl
    in:
      runscript: script_generator/runscript_bash
      code_folder: download_data/code_folder
      outputs_folder: download_data/outputs_folder
    
    # out: [watchdog_report, outputs_folder, code_folder, output_stdout, output_stderr]
    out: [watchdog_report, results_folder]

    label: Run model

# Get generated output files after model's run
  extract_watchdog:
    run: extract_watchdog.cwl
    in:
      watchdog_report: run_model/watchdog_report
      report: download_data/report
      # code_folder: download_data/code_folder
      # outputs_folder: download_data/outputs_folder
      results_folder: run_model/results_folder
      
    out: [report]
    label: Extract Watchdog

# Verification Method: Compare output files to expected ones
  verification_output_analysis:
    run: verification_output_analysis.cwl
    in:
      report: extract_watchdog/report
      outputs_folder: download_data/outputs_folder
      results_folder: run_model/results_folder

    out: [output_comparison_report]

    label: Verification output comparison

# Verification Method: Analyze documentation quality
  verification_documentation_analysis:
  # TODO
    run: verification_documentation_analysis.cwl
    in:
      report: download_data/report
      code_folder: download_data/code_folder

    out: [documentation_report]
    label: Verification documentation analysis

# Compile all verification scores and report to propose final verification score
  decision_maker:
  # TODO
    run: decision_maker.cwl
    in:
      report_list:
        source: [verification_output_analysis/output_comparison_report, verification_documentation_analysis/documentation_report]
        linkMerge: merge_flattened
      
    out: [decision_report]
    label: Decision Maker


s:identifier: https://kg.ebrains.eu/api/instances/fbcef0f9-369c-45cb-a0be-56fdecdc9745
s:keywords: ["model verification fa393b61-92ab-4925-ad53-d36cde34c5d6"]
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