# **Realme C3 / Narzo 10A — OrangeFox Recovery** 

**Codename:** RMX2020 / RMX2027 **Variant:** RUI2 BASED **Version:** R11

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

## 🙏 Credits

* TeamWin — TWRP
* OrangeFox Recovery Team
* Android Open Source Project (AOSP)
