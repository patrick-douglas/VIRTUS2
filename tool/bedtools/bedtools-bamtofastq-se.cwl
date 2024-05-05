class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: bedtools_bamtofastq_se
baseCommand:
  - bedtools
  - bamtofastq
inputs:
  - id: input
    type: File
    inputBinding:
      position: 0
      prefix: '-i'
  - id: fq
    type: string
    inputBinding:
      position: 2
      prefix: '-fq'
outputs:
  - id: output_fq
    type: File
    outputBinding:
      glob: $(inputs.fq)
label: bedtools-bamtofastq-pe
requirements:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/bedtools:2.31.1--hf5e1c6e_1'
  - class: InlineJavascriptRequirement
