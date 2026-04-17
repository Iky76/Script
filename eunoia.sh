#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init --no-repo-verify --git-lfs -u https://github.com/EunoiaOS/eunoia.git -b eunoia-1.1 -g default,-mips,-darwin,-notdefault
/opt/crave/resync.sh || repo sync

git clone --depth=1 https://github.com/Iky76/device_xiaomi_mido.git -b lineage-21.0 device/xiaomi/mido
git clone --depth=1 https://github.com/Iky76/vendor_xiaomi_mido.git -b lineage-21.0 vendor/xiaomi
git clone --depth=1 https://github.com/zeelog/android_kernel_xiaomi_mido.git -b lineage-21.0 kernel/xiaomi/mido

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-21 hardware/xiaomi

export BUILD_USERNAME=miku
export BUILD_HOSTNAME=crave

source build/envsetup.sh
bloom mido
