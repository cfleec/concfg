@echo off
cinst 7zip -y
regedit.exe /S "%~dp06-7z_HKCR.reg"
regedit.exe /S "%~dp06-7z_HKCU.reg"