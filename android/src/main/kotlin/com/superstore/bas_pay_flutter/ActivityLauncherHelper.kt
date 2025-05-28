//package com.superstore.bas_pay_flutter
//
//// Inside ActivityLauncherHelper (simplified)
//import kotlinx.coroutines.CompletableDeferred
//import kotlinx.coroutines.suspendCancellableCoroutine // Alternative for more control
//import kotlin.coroutines.resume // For suspendCancellableCoroutine
//import androidx.activity.ComponentActivity
//import androidx.activity.result.ActivityResultLauncher
//import android.content.Intent
//import androidx.activity.result.contract.ActivityResultContracts
//import android.app.Activity
//import android.util.Log
//
//
//class ActivityLauncherHelper(private val activity: ComponentActivity) {
//    private lateinit var activityLauncher: ActivityResultLauncher<Intent>
//
//    // This will hold the "promise" for the result of a single launch operation
//    private var currentOperationDeferred: CompletableDeferred<YourResultType?>? = null
//
//    init {
//        activityLauncher = activity.registerForActivityResult(
//            ActivityResultContracts.StartActivityForResult()
//        ) { activityResult -> // THE CALLBACK
//            val deferredToComplete = currentOperationDeferred
//            currentOperationDeferred = null // Important: Clear for the next operation
//
//            if (deferredToComplete == null) {
//                // No one is currently awaiting this result, perhaps an old operation
//                Log.w("Helper", "No active deferred for this activity result.")
//                return@registerForActivityResult
//            }
//
//            if (activityResult.resultCode == Activity.RESULT_OK) {
//                val data: Intent? = activityResult.data
//                val parsedResult: YourResultType = parseDataToYourResultType(data) // Implement this
//                deferredToComplete.complete(parsedResult) // << COMPLETE THE DEFERRED (Resumes awaiter)
//            } else {
//                deferredToComplete.complete(null) // << COMPLETE WITH NULL for cancellation/error (Resumes awaiter)
//            }
//        }
//    }
//
//    // This is the function you call and "await"
//    suspend fun launchAndAwaitResult(intentToLaunch: Intent): YourResultType? {
//        // 1. Create a new promise for *this specific call*
//        val newDeferred = CompletableDeferred<YourResultType?>()
//        currentOperationDeferred = newDeferred // Store it so the callback can find it
//
//        // 2. Launch the activity (non-blocking)
//        Log.d("Helper", "Launching activity...")
//        activityLauncher.launch(intentToLaunch)
//
//        // 3. AWAIT THE PROMISE
//        Log.d("Helper", "Awaiting result...")
//        // The coroutine calling this function will SUSPEND HERE
//        // until newDeferred.complete() is called by the callback above.
//        val result = newDeferred.await()
//        Log.d("Helper", "Result received by await: $result")
//        return result
//    }
//
//    private fun parseDataToYourResultType(intentData: Intent?): YourResultType {
//        // Your logic to extract data from intentData and create YourResultType
//        // Example: return YourResultType(success = true, data = intentData?.getStringExtra("key"))
//        return YourResultType(true, intentData?.getStringExtra("your_result_key")) // Simplified
//    }
//}
//
//// Placeholder for your result type
//data class YourResultType(val success: Boolean, val data: String?)