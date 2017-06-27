gcloud ml-engine jobs submit training neural_style_test_101 \
--staging-bucket gs://wombatflow \
--runtime-version 1.2 \
--module-name trainer.neural_style \
--package-path trainer/ \
--config config.yml \
--region $REGION \
-- \
--network gs://wombatflow/data/pretrained_nets/imagenet-vgg-verydeep-19.mat \
--content gs://wombatflow/data/examples/1-content.jpg \
--styles gs://wombatflow/data/examples/1-style.jpg \
--output gs://wombatflow/data/output/output.jpg \



gcloud ml-engine local train \
--module-name neural_style.trainer.neural_style \
--package-path ./ \
-- \
--content gs://wombatflow/data/examples/1-content.jpg \
--styles gs://wombatflow/data/examples/1-style.jpg \
--output gs://wombatflow/data/output/output.jpg


gcloud ml-engine jobs submit training neural_style_test_3 \
--job-dir gs://wombatflow/jobs/neural_style_test_3 \
--runtime-version 1.2 \
--module-name trainer.neural_style \
--package-path trainer/ \
--region $REGION \
-- \
--content gs://wombatflow/data/examples/1-content.jpg \
--styles gs://wombatflow/data/examples/1-style.jpg \
--output gs://wombatflow/data/output/output.jpg
