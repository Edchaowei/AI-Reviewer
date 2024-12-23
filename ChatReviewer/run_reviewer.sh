# start
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/root/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/root/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/root/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/root/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/user/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/user/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/user/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/user/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda activate new_sd

cd /disk2-7681G/users/cuichaowei/AI-Reviewer/ChatReviewer
mkdir ./logs
source .env
export CUDA_VISIBLE_DEVICES='1'
echo $model_path

nohup python -m vllm.entrypoints.openai.api_server --model "$model_path"  --port 8341 --served-model-name "$served_model_name" --gpu-memory-utilization 0.9 --max-model-len 2048 --chat-template ./chatlm.jinja  >> ./logs/vllm.nohup &
# python chat_reviewer.py --paper_path "input_file/demo1.pdf" --api_key "$openai_api_key" --based_url "$openai_api_base" --model_name "$served_model_name"  >> ./logs/chat_reviewer.nohup &