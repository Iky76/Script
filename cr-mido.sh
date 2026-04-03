#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86
rm -rf device/xiaomi/mido vendor/xiaomi/mido kernel/xiaomi/mido
rm -rf hardware/qcom-caf/common hardware/qcom-caf/bt

repo init --no-repo-verify --git-lfs -u https://github.com/crdroidandroid/android.git -b 15 -g default,-mips,-darwin,-notdefault
/opt/crave/resync.sh || repo sync

git clone --depth=1 https://github.com/zeelog/android_device_xiaomi_mido.git -b lineage-22.2 device/xiaomi/mido
git clone --depth=1 https://github.com/zeelog/proprietary_vendor_xiaomi.git -b lineage-22.2 vendor/xiaomi
git clone --depth=1 https://github.com/zeelog/android_kernel_xiaomi_mido.git -b lineage-22.2 kernel/xiaomi/mido

export BUILD_USERNAME=Rizj
export BUILD_HOSTNAME=Crave

. build/envsetup.sh
brunch mido
m bacon
