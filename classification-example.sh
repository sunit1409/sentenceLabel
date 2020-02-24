RESULTDIR=result
DATADIR=data

mkdir -p "${RESULTDIR}"



make

./fasttext supervised -input "${DATADIR}/dbpedia.train" -output "${RESULTDIR}/dbpedia" -dim 10 -lr 0.1 -wordNgrams 2 -minCount 1 -bucket 10000000 -epoch 5 -thread 4

./fasttext test "${RESULTDIR}/dbpedia.bin" "${DATADIR}/dbpedia.test"

./fasttext predict "${RESULTDIR}/dbpedia.bin" "${DATADIR}/dbpedia.test" > "${RESULTDIR}/dbpedia.test.predict"
