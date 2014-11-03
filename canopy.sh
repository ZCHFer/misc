  $MAHOUT seq2sparse \
    -i ${WORK_DIR}/reuters-out-seqdir/ \
    -o ${WORK_DIR}/reuters-out-seqdir-sparse-canopy --maxDFPercent 85 --namedVector \
  && \
  $MAHOUT canopy \
    -i ${WORK_DIR}/reuters-out-seqdir-sparse-canopy/tfidf-vectors/ \
    -o ${WORK_DIR}/reuters-canopy \
    -dm org.apache.mahout.common.distance.CosineDistanceMeasure \
    -t1 0.3 -t2 0.5 -ow -cl
  && \
  $MAHOUT clusterdump \
    -i ${WORK_DIR}/reuters-canopy/clusters-*-final \
    -o ${WORK_DIR}/reuters-canopy/clusterdump \
    -d ${WORK_DIR}/reuters-out-seqdir-sparse-canopy/dictionary.file-0 \
    -dt sequencefile -b 100 -n 20 -sp 0 \