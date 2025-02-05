# One-shot Implicit Animatable Avatars with Model-based Priors

https://user-images.githubusercontent.com/29389089/216925630-50f9226c-17ee-4d5f-9c60-78c86e630bfc.mp4

_ELICIT creates free-viewpoint motion videos from a single image by constructing an animatable NeRF representation in one-shot learning._


Official repository of "One-shot Implicit Animatable Avatars with Model-based Priors".

[[Arxiv](https://arxiv.org/abs/2212.02469)] [[Website](https://elicit3d.github.io)]

## What Can Your Learn from ELICIT?
1. The **data-efficient** pipeline of creating a 3D animatable avatar from **a single image**.
2. Use **CLIP-based semantic loss** to infer the entire
3D appearance of the human body with the help of a rough SMPL shape.
3. A **segmentation-based sampling strategy** to create more realistic visual details and geometries for 3D avatars.


## Installation

Please follow the [Installation Instruction](docs/install.md) to setup all the required packages.

## Data

### Results of the experiments

We provide **result videos** in our **webpage** for the qualitative and quantitative evaluations in our paper. We also provided checkpoints for those experiments in [Google Drive](https://drive.google.com/file/d/13YukhgObfeyNODWvXJOPJWbIwQyFPLNo/view?usp=sharing).

### Training data for re-implementation

For the datasets we use for quantitative evaluations (ZJU-MoCAP, Human 3.6M), please [prepare](https://github.com/zju3dv/neuralbody/blob/master/tools/custom) the original datasets into the same format as ZJU-MoCAP. Then use our scripts in `tools` to preprocess the dataset and render SMPL meshes for training.

For customized single-image data, we provides examples from DeepFashion datasets in `dataset/fashion`.

See more details in [Data Instruction](docs/data.md).

## Getting Started

### Training

```bash
python train.py --cfg configs/elicit/zju_mocap/377/smpl_init_texture.yaml # Run SMPL Meshes initialization.
python train.py --cfg configs/elicit/zju_mocap/377/finetune.yaml # Run training on the input subject.
```

We also provide checkpoints for all the subjects in [Google Drive](https://drive.google.com/file/d/13YukhgObfeyNODWvXJOPJWbIwQyFPLNo/view?usp=sharing), please unzip the file in the following structure:
```
${ELICIT_ROOT}
    └── experiments
        └── elicit
            ├── zju_mocap
            ├── h36m
            └── fashion
```

### Evaluation / Rendering

Evaluate novel pose synthesis.
```bash
python run.py --type movement --cfg configs/elicit/zju_mocap/377/finetune.yaml 
```

Evaluate novel view synthesis.
```bash
python run.py --type freeview --cfg configs/elicit/zju_mocap/377/finetune.yaml freeview.use_gt_camera True
```

Freeview rendering on arbitrary frames.
```bash
python run.py --type freeview  --cfg configs/elicit/zju_mocap/377/finetune.yaml freeview.frame_idx $FRAME_INDEX_TO_RENDER
```

The rendered frames and video will be saved at `experiments/zju_mocap/377/latest`.

## Citation

```bibtex
@article{huang2022one,
  title={One-shot Implicit Animatable Avatars with Model-based Priors},
  author={Huang, Yangyi and Yi, Hongwei and Liu, Weiyang and Wang, Haofan and Wu, Boxi and Wang, Wenxiao and Lin, Binbin and Zhang, Debing and Cai, Deng},
  journal={arXiv preprint arXiv:2212.02469},
  year={2022}
}
```

## Acknowledgments

Our implementation is mainly based on [HumanNeRF](https://github.com/chungyiweng/humannerf), and took reference from [Animatable NeRF](https://github.com/zju3dv/animatable_nerf) and [AvatarCLIP](https://github.com/hongfz16/AvatarCLIP). We thanks the authors for their open source contributions. In addition, we thank the authors of [Animatble NeRF](https://github.com/zju3dv/animatable_nerf) for their help in the data preprocessing of Human 3.6M.
