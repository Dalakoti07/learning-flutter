package com.dalakoti07.android.blemasterpro.bt

interface ScanningAdapter {

    fun startScanning(name: String, uuids: Array<String>)

    fun stopScanning()

    fun getFoundDeviceList(): List<BlueToothDevice>

}