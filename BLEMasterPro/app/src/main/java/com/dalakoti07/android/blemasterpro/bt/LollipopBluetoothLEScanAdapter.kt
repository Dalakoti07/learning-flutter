package com.dalakoti07.android.blemasterpro.bt

import android.annotation.SuppressLint
import android.bluetooth.BluetoothManager
import android.bluetooth.le.BluetoothLeScanner
import android.bluetooth.le.ScanCallback
import android.bluetooth.le.ScanFilter
import android.bluetooth.le.ScanResult
import android.content.Context
import android.os.Handler

class LollipopBluetoothLEScanAdapter(
    context: Context,
    private val leScanCallback: ScanCallback
) :
    ScanningAdapter {

    private var scanning = false

    private val handler = Handler()

    var bluetoothLeScanner: BluetoothLeScanner? = null

    var mBluetoothDeviceList: List<BlueToothDevice>? = null

    init {
        val bluetoothManager =
            context.getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager
        bluetoothLeScanner = bluetoothManager.adapter.bluetoothLeScanner
    }

    @SuppressLint("MissingPermission")
    override fun startScanning(name: String, uuids: Array<String>) {
        if (!scanning) { // Stops scanning after a pre-defined scan period.
            handler.postDelayed({
                scanning = false
                bluetoothLeScanner?.stopScan(leScanCallback)
            }, 10_000)
            scanning = true
            bluetoothLeScanner?.startScan(leScanCallback)
        } else {
            scanning = false
            bluetoothLeScanner?.stopScan(leScanCallback)
        }
    }

    @SuppressLint("MissingPermission")
    override fun stopScanning() {
        bluetoothLeScanner?.stopScan(leScanCallback)
    }

    override fun getFoundDeviceList(): List<BlueToothDevice> {
        return emptyList()
    }

}