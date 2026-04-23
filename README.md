# **Realme C3 / Narzo 10A — OrangeFox Recovery** 

**Codename:** RMX2020 / RMX2027 **Variant:** RUI2 BASED

---

## 📌 Recovery Features

* ✅ Decryption
* ✅ Flashing
* ✅ Backup & Restore
* ✅ KernelSU Manager support
* ✅ MTP / OTG Storage
* ✅ ADB / FastbootD
* ✅ Factory Reset

---

## ⚡ Flashing Guide

### 🔹 Flashing over Stock Recovery

1. Reboot to bootloader:

```
adb reboot bootloader
```

2. Download patched `vbmeta.img` and flash:

```
fastboot flash --disable-verity --disable-verification vbmeta vbmeta.img
```

3. Flash recovery image:

```
fastboot flash recovery recovery.img
```

4. Reboot into recovery:

```
fastboot reboot recovery
```

5. Flash `recovery.zip` from OrangeFox recovery

---

### 🔹 Flashing over Custom Recovery

1. Download `recovery.zip` from Release Page
2. Flash the zip via existing custom recovery
3. Reboot back into recovery

---

## ⚡ Building Guide

### Sync OrangeFox sources and minimal manifest

```
mkdir ~/OrangeFox_sync
cd ~/OrangeFox_sync
git clone https://gitlab.com/OrangeFox/sync.git
cd ~/OrangeFox_sync/sync/
./orangefox_sync.sh --branch 12.1 --path ~/fox_12.1
```

### Place device trees and kernel

```
cd ~/fox_12.1
git clone https://github.com/dpxdoss/android_recovery_realme_RMX2020.git device/realme/RMX2020

```

## Build it

```
cd ~/fox_12.1
source build/envsetup.sh
make clean && lunch twrp_RMX2020-eng && mka adbd recoveryimage

```

## 🙏 Credits

* TeamWin — TWRP
* OrangeFox Recovery Team
* Android Open Source Project (AOSP)
