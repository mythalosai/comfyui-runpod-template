#!/bin/bash

cd /workspace/ComfyUI

echo "📦 Setting up environment..."

# =========================
# 📁 CREATE DIRECTORIES
# =========================

mkdir -p models/checkpoints
mkdir -p models/vae
mkdir -p models/loras
mkdir -p models/text_encoders
mkdir -p models/upscale_models

# =========================
# 🔽 QWEN MODELS
# =========================

if [ ! -f models/checkpoints/qwen_2.5_vl_7b_fp8_scaled.safetensors ]; then
    echo "Downloading Qwen VL..."
    wget -c -O models/checkpoints/qwen_2.5_vl_7b_fp8_scaled.safetensors \
    https://huggingface.co/f5aiteam/CLIP/resolve/main/qwen_2.5_vl_7b_fp8_scaled.safetensors
fi

if [ ! -f models/vae/qwen_image_vae.safetensors ]; then
    echo "Downloading VAE..."
    wget -c -O models/vae/qwen_image_vae.safetensors \
    https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors
fi

if [ ! -f models/checkpoints/qwen_image_edit_2511.safetensors ]; then
    echo "Downloading Qwen Image Edit..."
    wget -c -O models/checkpoints/qwen_image_edit_2511.safetensors \
    https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_2511_bf16.safetensors
fi

# =========================
# 🔽 LTX MODELS
# =========================

if [ ! -f models/checkpoints/ltx_2.3_22b_fp8.safetensors ]; then
    echo "Downloading LTX 2.3..."
    wget -c -O models/checkpoints/ltx_2.3_22b_fp8.safetensors \
    https://huggingface.co/Lightricks/LTX-2.3-fp8/resolve/main/ltx-2.3-22b-dev-fp8.safetensors
fi

if [ ! -f models/upscale_models/ltx_upscaler_x2.safetensors ]; then
    echo "Downloading Upscaler..."
    wget -c -O models/upscale_models/ltx_upscaler_x2.safetensors \
    https://huggingface.co/Lightricks/LTX-2.3/resolve/main/ltx-2.3-spatial-upscaler-x2-1.0.safetensors
fi

if [ ! -f models/loras/ltx_2.3_lora_384.safetensors ]; then
    echo "Downloading LORA..."
    wget -c -O models/loras/ltx_2.3_lora_384.safetensors \
    https://huggingface.co/Lightricks/LTX-2.3/resolve/main/ltx-2.3-22b-distilled-lora-384.safetensors
fi

# =========================
# 🔽 GEMMA (TEXT ENCODER)
# =========================

if [ ! -f models/text_encoders/gemma_3_12b_fp4.safetensors ]; then
    echo "Downloading Gemma..."
    wget -c -O models/text_encoders/gemma_3_12b_fp4.safetensors \
    https://huggingface.co/Comfy-Org/ltx-2/resolve/main/split_files/text_encoders/gemma_3_12B_it_fp4_mixed.safetensors
fi

# =========================
# 🚀 START COMFYUI
# =========================

echo "🚀 Starting ComfyUI..."

python main.py --listen 0.0.0.0 --port 8188
