#! /bin/bash

rm -rf .repo/local_manifests; \
repo init -u https://github.com/AxionAOSP/android.git -b lineage-23.1 --git-lfs; \
rm -rf prebuilts/clang/host/linux-x86; \
/opt/crave/resync.sh; \

mf=(
device/xiaomi/munch
kernel/xiaomi/munch
vendor/xiaomi/munch
vendor/xiaomi/munch-firmware
hardware/xiaomi
hardware/dolby
vendor/xiaomi/miuicamera
)

rm -rf "${mf[@]}"

git clone https://github.com/Sarthak7teen/android_device_xiaomi_munch -b 16-qpr1 device/xiaomi/munch

git clone https://github.com/Sarthak7teen/android_vendor_xiaomi_munch -b 16-qpr1 vendor/xiaomi/munch

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware

git clone  https://github.com/Sarthak7teen/android_kernel_xiaomi_munch -b 404 kernel/xiaomi/munch

git clone https://github.com/Lordputin404/android_hardware_xiaomi hardware/xiaomi

git clone https://github.com/munch-devs/android_hardware_dolby hardware/dolby

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera

cd hard*/line*/compat/ &&git fetch https://github.com/LineageOS/android_hardware_lineage_compat refs/changes/04/447604/1 && git cherry-pick FETCH_HEAD && cd -
source build/envsetup.sh
gk -s
axion munch userdebug va
ax -br -j16
