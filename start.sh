#!/bin/bash

set -e

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
mkdir -p models/diffusion_models

# =========================
# 🔽 TEXT ENCODERS
# =========================

if [ ! -f models/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors ]; then
    echo "Downloading Qwen VL (text encoder)..."
    wget -c -O models/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors \
    https://huggingface.co/f5aiteam/CLIP/resolve/main/qwen_2.5_vl_7b_fp8_scaled.safetensors
fi

if [ ! -f models/text_encoders/qwen_3_4b.safetensors ]; then
    echo "Downloading Qwen 3.4B encoder..."
    wget -c -O models/text_encoders/qwen_3_4b.safetensors \
    https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors
fi

if [ ! -f models/text_encoders/gemma_3_12b_fp4.safetensors ]; then
    echo "Downloading Gemma..."
    wget -c -O models/text_encoders/gemma_3_12b_fp4.safetensors \
    https://huggingface.co/Comfy-Org/ltx-2/resolve/main/split_files/text_encoders/gemma_3_12B_it_fp4_mixed.safetensors
fi

# =========================
# 🔽 DIFFUSION MODELS
# =========================

if [ ! -f models/diffusion_models/qwen_image_edit_2511_bf16.safetensors ]; then
    echo "Downloading Qwen Image Edit..."
    wget -c -O models/diffusion_models/qwen_image_edit_2511_bf16.safetensors \
    https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_2511_bf16.safetensors
fi

if [ ! -f models/diffusion_models/z_image_turbo_bf16.safetensors ]; then
    echo "Downloading Z Image Turbo..."
    wget -c -O models/diffusion_models/z_image_turbo_bf16.safetensors \
    https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/diffusion_models/z_image_turbo_bf16.safetensors
fi

# =========================
# 🔽 CHECKPOINTS
# =========================

if [ ! -f models/checkpoints/ltx_2.3_22b_dev_fp8.safetensors ]; then
    echo "Downloading LTX 2.3 dev..."
    wget -c -O models/checkpoints/ltx_2.3_22b_dev_fp8.safetensors \
    https://huggingface.co/Lightricks/LTX-2.3-fp8/resolve/main/ltx-2.3-22b-dev-fp8.safetensors
fi

if [ ! -f models/checkpoints/ltx_2.3_22b_distilled.safetensors ]; then
    echo "Downloading LTX distilled..."
    wget -c -O models/checkpoints/ltx_2.3_22b_distilled.safetensors \
    https://huggingface.co/Lightricks/LTX-2.3/resolve/main/ltx-2.3-22b-distilled.safetensors
fi

# =========================
# 🔽 VAE
# =========================

if [ ! -f models/vae/qwen_image_vae.safetensors ]; then
    echo "Downloading Qwen VAE..."
    wget -c -O models/vae/qwen_image_vae.safetensors \
    https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors
fi

if [ ! -f models/vae/zimage_vae.safetensors ]; then
    echo "Downloading Z Image VAE..."
    wget -c -O models/vae/zimage_vae.safetensors \
    https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/vae/ae.safetensors
fi

# =========================
# 🔽 UPSCALERS
# =========================

if [ ! -f models/upscale_models/ltx_upscaler_x2.safetensors ]; then
    echo "Downloading LTX Upscaler..."
    wget -c -O models/upscale_models/ltx_upscaler_x2.safetensors \
    https://huggingface.co/Lightricks/LTX-2.3/resolve/main/ltx-2.3-spatial-upscaler-x2-1.0.safetensors
fi

if [ ! -f models/upscale_models/clear_reality.pth ]; then
    echo "Downloading ClearReality Upscaler..."
    wget -c -O models/upscale_models/clear_reality.pth \
    https://huggingface.co/skbhadra/ClearRealityV1/resolve/bc01e27b38eec683dc6e3161dd56069c78e015ac/4x-ClearRealityV1.pth
fi

# =========================
# 🔽 LORAS
# =========================

if [ ! -f models/loras/qwen_lightning.safetensors ]; then
    echo "Downloading Qwen Lightning LoRA..."
    wget -c -O models/loras/qwen_lightning.safetensors \
    https://huggingface.co/lightx2v/Qwen-Image-Edit-2511-Lightning/resolve/main/Qwen-Image-Edit-2511-Lightning-4steps-V1.0-bf16.safetensors
fi

if [ ! -f models/loras/qwen_multiangle.safetensors ]; then
    echo "Downloading Multi-Angle LoRA..."
    wget -c -O models/loras/qwen_multiangle.safetensors \
    https://huggingface.co/fal/Qwen-Image-Edit-2511-Multiple-Angles-LoRA/resolve/main/qwen-image-edit-2511-multiple-angles-lora.safetensors
fi

if [ ! -f models/loras/fruitisland_qwen.safetensors ]; then
    echo "Downloading FruitIsland Qwen LoRA..."
    wget -c -O models/loras/fruitisland_qwen.safetensors \
    https://huggingface.co/Mythalos/FruitIlsland/resolve/main/fruitisland_qwenimage.safetensors
fi

if [ ! -f models/loras/fruitisland_zimage.safetensors ]; then
    echo "Downloading FruitIsland ZImage LoRA..."
    wget -c -O models/loras/fruitisland_zimage.safetensors \
    https://huggingface.co/Mythalos/FruitIlsland/resolve/main/fruitisland_zimage.safetensors
fi

if [ ! -f models/loras/ltx_id_lora.safetensors ]; then
    echo "Downloading LTX ID LoRA..."
    wget -c -O models/loras/ltx_id_lora.safetensors \
    https://huggingface.co/AviadDahan/LTX-2.3-ID-LoRA-CelebVHQ-3K/resolve/main/lora_weights.safetensors
fi

# =========================
# 🚀 START COMFYUI
# =========================

echo "🚀 Starting ComfyUI..."

python main.py --listen 0.0.0.0 --port 8188 --enable-cors-header
