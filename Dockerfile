FROM nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git \
    wget \
    python3 \
    python3-pip \
    python3-venv \
    ffmpeg \
    libgl1

# Set python
RUN ln -s /usr/bin/python3 /usr/bin/python

# Install PyTorch
RUN pip install --upgrade pip
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

# Fix OpenCV
RUN pip install opencv-python

# Clone ComfyUI
WORKDIR /workspace
RUN git clone https://github.com/comfyanonymous/ComfyUI

# Install requirements
WORKDIR /workspace/ComfyUI
RUN pip install -r requirements.txt

# =========================
# 🔽 CUSTOM NODES
# =========================

WORKDIR /workspace/ComfyUI/custom_nodes

RUN git clone https://github.com/ltdrdata/ComfyUI-Manager
RUN git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack
RUN git clone https://github.com/rgthree/rgthree-comfy
RUN git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite
RUN git clone https://github.com/kijai/ComfyUI-KJNodes
RUN git clone https://github.com/TerryJia/Qwen-Multiangle-Camera

# =========================

WORKDIR /workspace/ComfyUI

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
