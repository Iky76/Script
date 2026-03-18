#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init --no-repo-verify --git-lfs -u https://github.com/ArrowOS-T/android_manifest.git -b arrow-13.1_ext -g default,-mips,-darwin,-notdefault
/opt/crave/resync.sh || repo sync

git clone --depth=1 https://github.com/Iky76/device_xiaomi_mido.git -b arrow device/xiaomi/mido
git clone --depth=1 https://github.com/Iky76/vendor_xiaomi_mido_A13.git -b android-13 vendor/xiaomi/mido
git clone --depth=1 https://github.com/PixysOS-Devices/kernel_xiaomi_mido.git -b thirteen kernel/xiaomi/mido

git clone https://github.com/LineageOS/android_hardware_qcom-caf_common.git -b lineage-20.0 hardware/qcom-caf/common
git clone https://github.com/LineageOS/android_hardware_qcom_bt.git -b lineage-20.0-caf hardware/qcom-caf/bt

export BUILD_USERNAME=Rizj
export BUILD_HOSTNAME=DooPrjkt
export SOONG_ALLOW_MISSING_DEPENDENCIES=true

. build/envsetup.sh
lunch lineage_mido-userdebug
m bacon
