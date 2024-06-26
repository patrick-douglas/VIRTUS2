#!/usr/bin/env cwltool

class: Workflow
cwlVersion: v1.0
id: createindex
doc: VIRTUS v2.0
label: CreateIndex_localref
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: f_virus
    type: File
    'sbg:x': -1123.8369140625
    'sbg:y': -782.5
  - id: dir_name_STAR_virus
    type: string
    'sbg:x': -1126.984130859375
    'sbg:y': -518.8207397460938
  - id: f_human
    type: File
    'sbg:x': -1102
    'sbg:y': -167
  - id: dir_name_STAR_human
    type: string
    'sbg:x': -1108
    'sbg:y': 115
  - id: runThreadN
    type: int?
    'sbg:x': -1116
    'sbg:y': -318
outputs:
  - id: starIndex_virus
    outputSource:
      - star_index_virus/starIndex
    type: Directory
    'sbg:x': -486.8369140625
    'sbg:y': -606.5
  - id: starIndex_human
    outputSource:
      - star_index_human/starIndex
    type: Directory
    'sbg:x': -491.496826171875
    'sbg:y': -166.5
steps:
  - id: star_index_virus
    in:
      - id: genomeDir
        source: mkdir_virus/created_directory
      - id: genomeFastaFiles
        source: f_virus
      - id: runThreadN
        source: runThreadN
      - id: genomeSAindexNbases
        default: 12
    out:
      - id: starIndex
    run: ../tool/star/star_index/star_index.cwl
    label: 'STAR genomeGenerate: Generating genome indexes.'
    'sbg:x': -709.8369140625
    'sbg:y': -605.5
  - id: mkdir_virus
    in:
      - id: dir_name
        default: STAR_index_virus
        source: dir_name_STAR_virus
    out:
      - id: created_directory
    run: ../tool/mkdir/mkdir.cwl
    label: Make directory if not exists
    'sbg:x': -937.1593627929688
    'sbg:y': -520.8286743164062

  - id: star_index_human
    in:
      - id: genomeDir
        source: mkdir_human/created_directory
      - id: genomeFastaFiles
        source: f_human
      - id: runThreadN
        source: runThreadN
      - id: genomeSAindexNbases
        default: 14
    out:
      - id: starIndex
    run: ../tool/star/star_index/star_index.cwl
    label: 'STAR genomeGenerate: Generating genome indexes.'
    'sbg:x': -709.8369140625
    'sbg:y': -605.5

  - id: mkdir_human
    in:
      - id: dir_name
        default: STAR_index_human
        source: dir_name_STAR_human
    out:
      - id: created_directory
    run: ../tool/mkdir/mkdir.cwl
    label: Make directory if not exists
    'sbg:x': -937.1593627929688
    'sbg:y': -520.8286743164062


  # - id: rnaseq_star_index_human
  #   in:
  #     - id: runThreadN
  #       source: runThreadN
  #     - id: url_genomefasta
  #       source: url_genomefasta_human
  #     - id: output_name_genomefasta
  #       source: output_name_genomefasta_human
  #     - id: dir_name
  #       source: dir_name_STAR_human
  #     - id: genomeSAindexNbases
  #       default: 14
  #   out:
  #     - id: downloaded_genomefasta
  #     - id: starIndex
  #   run: rnaseq-star_index/rnaseq-star_index.cwl
  #   'sbg:x': -688
  #   'sbg:y': -91
requirements:
  - class: SubworkflowFeatureRequirement
