#!/bin/bash

export PYTHONPATH="$(pwd)/.."
REPORTS_DIR="$(pwd)/reports"
FINAL_REPORT="$REPORTS_DIR/report.txt"

if [ ! -d "$REPORTS_DIR" ]
then
    mkdir -p "$REPORTS_DIR"
fi

function run_topo()
{
    TOPO_FILE="$1"
    echo "Executing topology: $TOPO_FILE"
    CMD="python3 ../scalesim/scale.py -t ../topologies/$TOPO_FILE -c ../configs/scale.cfg ${@:2}"

    DIR_NAME="$(dirname $TOPO_FILE)"
    if [ ! -d "$REPORTS_DIR/$DIR_NAME" ]
    then
        mkdir -p "$REPORTS_DIR/$DIR_NAME"
    fi

    REPORT_FILE="$REPORTS_DIR/$TOPO_FILE.rpt"

    echo "Command = $CMD"
    { time { $CMD 2> /dev/null ; }; } >> "$REPORT_FILE" 2>&1

    python3 process_report.py "$TOPO_FILE" "$REPORT_FILE" >> "$FINAL_REPORT"
}

echo "# Execution date: $(date)" >> "$FINAL_REPORT"
echo "# topo;total_cycles;time;throughput" >> "$FINAL_REPORT"

run_topo CSV/FasterRCNN.csv -i conv
run_topo CSV/MLPERF.csv -i conv
run_topo CSV/DeepBenchLSTM.csv -i conv
run_topo CSV/LSTM.csv -i conv
run_topo CSV/DeepBench.csv -i conv
run_topo CSV/DeepBench_DenseMatrixMultiplication.csv -i conv
run_topo dlrm/dlrm_weight_grad.csv -i conv
run_topo dlrm/dlrm_inp_grad.csv -i conv
run_topo dlrm/DLRM.csv -i conv
run_topo dlrm/dlrm_fwd.csv -i conv
run_topo GEMM_mnk/transformer_partial.csv -i gemm
run_topo GEMM_mnk/NCF.csv -i gemm
run_topo GEMM_mnk/test_mnk_input.csv -i gemm
run_topo GEMM_mnk/unet2d.csv -i gemm
run_topo GEMM_mnk/gpt2.csv -i gemm
run_topo GEMM_mnk/gnmt.csv -i gemm
run_topo transformer/transformer_fwd.csv -i conv
run_topo transformer/transformer_weightgrad.csv -i conv
run_topo transformer/transformer_inpgrad.csv -i conv
run_topo resnet/resnet_weight_grad.csv -i conv
run_topo resnet/resnet_input_grad.csv -i conv
run_topo resnet/resnet_fwd.csv -i conv
run_topo mlperf/DeepSpeech2.csv -i conv
run_topo mlperf/div16q/DeepSpeech2.csv -i conv
run_topo mlperf/div16q/FasterRCNN.csv -i conv
run_topo mlperf/div16q/AlphaGoZero.csv -i conv
run_topo mlperf/div16q/Sentimental_seqLSTM_short.csv -i conv
run_topo mlperf/div16q/Transformer_short.csv -i conv
run_topo mlperf/div16q/Resnet50.csv -i conv
run_topo mlperf/div16q/NCF_recommendation_short.csv -i conv
run_topo mlperf/div16q/Sentimental_seqCNN.csv -i conv
run_topo mlperf/FasterRCNN.csv -i conv
run_topo mlperf/AlphaGoZero.csv -i conv
run_topo mlperf/div4q/DeepSpeech2.csv -i conv
run_topo mlperf/div4q/FasterRCNN.csv -i conv
run_topo mlperf/div4q/AlphaGoZero.csv -i conv
run_topo mlperf/div4q/Sentimental_seqLSTM_short.csv -i conv
run_topo mlperf/div4q/Transformer_short.csv -i conv
run_topo mlperf/div4q/Resnet50.csv -i conv
run_topo mlperf/div4q/NCF_recommendation_short.csv -i conv
run_topo mlperf/div4q/Sentimental_seqCNN.csv -i conv
run_topo mlperf/Sentimental_seqLSTM_short.csv -i conv
run_topo mlperf/MLPERF.csv -i conv
run_topo mlperf/Sentimental_seqLSTM.csv -i conv
run_topo mlperf/Transformer_short.csv -i conv
run_topo mlperf/div256q/DeepSpeech2.csv -i conv
run_topo mlperf/div256q/FasterRCNN.csv -i conv
run_topo mlperf/div256q/AlphaGoZero.csv -i conv
run_topo mlperf/div256q/Sentimental_seqLSTM_short.csv -i conv
run_topo mlperf/div256q/Transformer_short.csv -i conv
run_topo mlperf/div256q/Resnet50.csv -i conv
run_topo mlperf/div256q/NCF_recommendation_short.csv -i conv
run_topo mlperf/div256q/Sentimental_seqCNN.csv -i conv
run_topo mlperf/Transformer.csv -i conv
run_topo mlperf/div64q/DeepSpeech2.csv -i conv
run_topo mlperf/div64q/FasterRCNN.csv -i conv
run_topo mlperf/div64q/AlphaGoZero.csv -i conv
run_topo mlperf/div64q/Sentimental_seqLSTM_short.csv -i conv
run_topo mlperf/div64q/Transformer_short.csv -i conv
run_topo mlperf/div64q/Resnet50.csv -i conv
run_topo mlperf/div64q/NCF_recommendation_short.csv -i conv
run_topo mlperf/div64q/Sentimental_seqCNN.csv -i conv
run_topo mlperf/Resnet50.csv -i conv
run_topo mlperf/legacy/Alexnet.csv -i conv
run_topo mlperf/legacy/Googlenet.csv -i conv
run_topo mlperf/NCF_recommendation.csv -i conv
run_topo mlperf/NCF_recommendation_short.csv -i conv
run_topo mlperf/Sentimental_seqCNN.csv -i conv
run_topo mlperf/test.csv -i conv
run_topo translation/gpt2_old.csv -i conv
run_topo translation/gpt2_multihead_layers.csv -i conv
run_topo translation/gpt2_multihead_layers_old.csv -i conv
run_topo translation/gpt2_new.csv -i conv
run_topo translation/gpt2_sans_mulithead.csv -i conv
run_topo translation/gpt2.csv -i conv
run_topo conv_nets/mobilnet_paper.csv -i conv
run_topo conv_nets/FasterRCNN.csv -i conv
run_topo conv_nets/Resnet50_4k_no_pool.csv -i conv
run_topo conv_nets/mobilnet_reduce_run.csv -i conv
run_topo conv_nets/mobilenet.csv -i conv
run_topo conv_nets/Resnet18.csv -i conv
run_topo conv_nets/UNet_maestro.csv -i conv
run_topo conv_nets/yolo_tiny.csv -i conv
run_topo conv_nets/yolo.csv -i conv
run_topo conv_nets/Resnet_test.csv -i conv
run_topo conv_nets/Resnet50.csv -i conv
run_topo conv_nets/MobileNet_4k_non_dw.csv -i conv
run_topo conv_nets/alexnet.csv -i conv
run_topo conv_nets/Googlenet.csv -i conv
run_topo conv_nets/yolo_tiny_layer1.csv -i conv
run_topo conv_nets/UNet_2d.csv -i conv
run_topo conv_nets/mobilnet_4k.csv -i conv
run_topo conv_nets/test.csv -i conv
run_topo conv_nets/alexnet_part.csv -i conv
run_topo conv_nets/alexnet_full.csv -i conv
run_topo deepbench/DeepBench_Dense/DeepBench_GEMM_github_forintel.csv -i conv
run_topo deepbench/DeepBench_Dense/DeepBench_GEMM_github.csv -i conv
run_topo deepbench/DeepBench_Dense/DeepBench_DenseMatrixMultiplication.csv -i conv
run_topo deepbench/DeepBench_LSTM/MachineTranslation.csv -i conv
run_topo deepbench/DeepBench_LSTM/LanguageModelling.csv -i conv
run_topo deepbench/DeepBench_LSTM/DeepBenchLSTM.csv -i conv
run_topo deepbench/DeepBench_LSTM/CharacterLanguageModelling.csv -i conv
run_topo deepbench/DeepBenchConv/Resnet.csv -i conv
run_topo deepbench/DeepBenchConv/FaceRecognition.csv -i conv
run_topo deepbench/DeepBenchConv/Vision.csv -i conv
run_topo deepbench/DeepBenchConv/DeepSpeech.csv -i conv
run_topo deepbench/DeepBenchConv/FaceRecognitionID.csv -i conv
run_topo deepbench/DeepBenchConv/DeepBench.csv -i conv
run_topo deepbench/DeepBenchConv/SpeakerID.csv -i conv
run_topo deepbench/DeepBenchConv/OCR.csv -i conv
run_topo deepbench/deepbench_output.csv -i conv
run_topo rnn_eval/LSTM_template.csv -i conv
run_topo rnn_eval/deep_voice.csv -i conv
run_topo rnn_eval/melody_extraction_detection.csv -i conv
run_topo rnn_eval/google_translate_dec.csv -i conv
run_topo rnn_eval/handwriting_rec.csv -i conv
run_topo rnn_eval/google_translate_enc.csv -i conv
