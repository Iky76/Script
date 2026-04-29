#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86
rm -rf device/xiaomi/mido
rm -rf vendor/xiaomi/mido
rm -rf kernel/xiaomi/mido

repo init --no-repo-verify --git-lfs -u https://github.com/LineageOS/android.git -b lineage-20.0 -g default,-mips,-darwin,-notdefault
/opt/crave/resync.sh || repo sync

git clone --depth=1 https://github.com/Iky76/device_xiaomi_mido.git -b lineage-20.0 device/xiaomi/mido
git clone --depth=1 https://github.com/NRanjan-17/vendor_xiaomi_mido.git -b thirteen vendor/xiaomi/mido
git clone --depth=1 https://github.com/Iky76/android_kernel_xiaomi_mido.git -b lineage-20.0 kernel/xiaomi/mido

export BUILD_USERNAME=mambo
export BUILD_HOSTNAME=crave

. build/envsetup.sh
lunch lineage_mido-userdebug
m bacon
