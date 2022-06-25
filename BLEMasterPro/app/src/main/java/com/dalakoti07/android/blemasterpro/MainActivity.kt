package com.dalakoti07.android.blemasterpro

import android.annotation.SuppressLint
import android.bluetooth.BluetoothDevice
import android.bluetooth.le.ScanCallback
import android.bluetooth.le.ScanResult
import android.content.pm.PackageManager
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.TextView
import android.widget.Toast
import androidx.activity.result.contract.ActivityResultContracts
import androidx.core.content.ContextCompat
import com.dalakoti07.android.blemasterpro.bt.LollipopBluetoothLEScanAdapter

private const val TAG = "MainActivity"

class MainActivity : AppCompatActivity() {

    val requestPermissionLauncher =
        registerForActivityResult(
            ActivityResultContracts.RequestPermission()
        ) { isGranted: Boolean ->
            if (isGranted) {
                startScan()
            } else {
                Toast.makeText(this, "not granted", Toast.LENGTH_SHORT).show()
            }
        }

    private fun startScan() {
        Log.d(TAG, "scanning started ")
        lollipopBluetoothLEScanAdapter = LollipopBluetoothLEScanAdapter(
            this,
            leScanCallback,
        )
        lollipopBluetoothLEScanAdapter.startScanning("", emptyArray())
    }

    private lateinit var textView: TextView

    private lateinit var lollipopBluetoothLEScanAdapter: LollipopBluetoothLEScanAdapter;

    private val bluetoothDevices: MutableList<BluetoothDevice> = mutableListOf()

//    private val foundDevices: HashMap<Strin>

    // Device scan callback.
    private val leScanCallback: ScanCallback = object : ScanCallback() {
        @SuppressLint("MissingPermission")
        override fun onScanResult(callbackType: Int, result: ScanResult) {
            super.onScanResult(callbackType, result)
            if (result.device.name != null) {
                bluetoothDevices.add(result.device)
                textView.append("\n" + "name: ${result.device.name}, address: ${result.device.address}")
            }
            Log.d(TAG, "onScanResult: ${result.device.name}")
        }

        override fun onBatchScanResults(results: MutableList<ScanResult>?) {
            super.onBatchScanResults(results)

            Log.d(TAG, "onBatchScanResults: ....")
        }

        override fun onScanFailed(errorCode: Int) {
            super.onScanFailed(errorCode)
            Log.d(TAG, "onScanFailed: $errorCode ....")
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        textView = findViewById(R.id.hello_text)

        when {
            ContextCompat.checkSelfPermission(
                this,
                android.Manifest.permission.BLUETOOTH_SCAN
            ) == PackageManager.PERMISSION_GRANTED -> {
                Toast.makeText(this, "permission granted", Toast.LENGTH_SHORT).show()
                // You can use the API that requires the permission.
                startScan()
            }
            else -> {
                // You can directly ask for the permission.
                // The registered ActivityResultCallback gets the result of this request.
                requestPermissionLauncher.launch(
                    android.Manifest.permission.BLUETOOTH_SCAN
                )
            }
        }

        when {
            ContextCompat.checkSelfPermission(
                this,
                android.Manifest.permission.ACCESS_FINE_LOCATION
            ) == PackageManager.PERMISSION_GRANTED -> {
                Toast.makeText(this, "location permission granted", Toast.LENGTH_SHORT).show()
                // You can use the API that requires the permission.
                startScan()
            }
            else -> {
                // You can directly ask for the permission.
                // The registered ActivityResultCallback gets the result of this request.
                requestPermissionLauncher.launch(
                    android.Manifest.permission.ACCESS_FINE_LOCATION
                )
            }
        }

        when {
            ContextCompat.checkSelfPermission(
                this,
                android.Manifest.permission.BLUETOOTH_CONNECT
            ) == PackageManager.PERMISSION_GRANTED -> {
                Toast.makeText(this, "ble connect permission granted", Toast.LENGTH_SHORT).show()
                // You can use the API that requires the permission.
                startScan()
            }
            else -> {
                // You can directly ask for the permission.
                // The registered ActivityResultCallback gets the result of this request.
                requestPermissionLauncher.launch(
                    android.Manifest.permission.BLUETOOTH_CONNECT
                )
            }
        }

    }

}
