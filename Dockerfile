FROM runpod/pytorch:2.1.0-py3.10-cuda12.1

RUN apt-get update && apt-get install -y git wget

WORKDIR /workspace
RUN git clone https://github.com/comfyanonymous/ComfyUI

WORKDIR /workspace/ComfyUI
RUN pip install -r requirements.txt

WORKDIR /workspace/ComfyUI/custom_nodes
RUN git clone https://github.com/ltdrdata/ComfyUI-Manager
RUN git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack
RUN git clone https://github.com/rgthree/rgthree-comfy
RUN git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite

WORKDIR /workspace/ComfyUI

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
