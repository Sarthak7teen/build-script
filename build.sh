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


. build/envsetup.sh
axion munch userdebug va
ax -br
