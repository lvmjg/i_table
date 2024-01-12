package com.itable.app.i_table

import android.content.Intent
import android.os.Bundle
import android.os.PersistableBundle
import io.flutter.embedding.android.FlutterActivity
import kotlin.random.Random
import androidx.annotation.NonNull
import com.tpay.sdk.api.models.AutomaticPaymentMethods
import com.tpay.sdk.api.models.BlikAlias
import com.tpay.sdk.api.models.CertificatePinningConfiguration
import com.tpay.sdk.api.models.DigitalWallet
import com.tpay.sdk.api.models.Environment
import com.tpay.sdk.api.models.Language
import com.tpay.sdk.api.models.PayerContext
import com.tpay.sdk.api.models.PaymentMethod
import com.tpay.sdk.api.models.SheetOpenResult
import com.tpay.sdk.api.models.TokenizedCard
import com.tpay.sdk.api.models.merchant.Merchant
import com.tpay.sdk.api.models.payer.Payer
import com.tpay.sdk.api.models.transaction.Transaction
import com.tpay.sdk.api.paycard.CreditCardBrand
import com.tpay.sdk.api.payment.Payment
import com.tpay.sdk.api.payment.PaymentDelegate
import com.tpay.sdk.api.providers.MerchantDetailsProvider
import com.tpay.sdk.api.providers.SSLCertificatesProvider
import com.tpay.sdk.api.screenless.Notifications
import com.tpay.sdk.api.tpayModule.TpayModule
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterFragmentActivity() {


    private lateinit var paymentSheet : Payment.Sheet

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        TpayModule.configure(
                Merchant(
                        merchantId = "131830",
                        authorization = Merchant.Authorization(
                                clientId = "01HGRHPXEQ3R4Z4VBHZW986SXM-01HGRJR4H0NSMFAFAR09W5P192",
                                clientSecret = "99a2bb109e41674cdbd5c7c8cdedc557edbfdc134b066e511b14c8f89626a21b"
                        )
                )
        )

        TpayModule.configure(Environment.PRODUCTION)

        TpayModule.configure(
                paymentMethods = listOf(
                        PaymentMethod.Card,
                        PaymentMethod.Blik,
                        PaymentMethod.Pbl,
                        PaymentMethod.DigitalWallets(
                                wallets = listOf(DigitalWallet.GOOGLE_PAY)
                        )
                )
        )

        TpayModule.configure(object : MerchantDetailsProvider {
            override fun merchantDisplayName(language: Language): String {
                return when (language) {
                    Language.PL -> "polish name"
                    Language.EN -> "english name"
                }
            }

            override fun merchantCity(language: Language): String {
                return when (language) {
                    Language.PL -> "Warszawie"
                    Language.EN -> "Warsaw"
                }
            }

            override fun regulationsLink(language: Language): String {
                return when (language) {
                    Language.PL -> "polish regulation url"
                    Language.EN -> "english regulation url"
                }
            }
        })

        TpayModule.configure(object : SSLCertificatesProvider {
            override var apiConfiguration: CertificatePinningConfiguration =
                    CertificatePinningConfiguration(publicKeyHash = "PUBLIC_KEY")
        })

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "example.com/channel").setMethodCallHandler {
            call, result ->


            if(call.method == "getRandomNumber") {
                val rand = Random.nextInt(100)



                // Create payment
               paymentSheet = Payment.Sheet(
                        object : Transaction {
                            override val amount: Double = call.argument("price")!!
                            override val description: String = "transaction description"
                            override val payerContext: PayerContext = PayerContext(
                                    payer = Payer(
                                            name = "Jan Godlewski",
                                            email = "janxgodlewski@gmail.com",
                                            phone = null,
                                            address = null
                                    ),
                                    automaticPaymentMethods = AutomaticPaymentMethods(
                                            blikAlias = BlikAlias.Registered(value = "alias value", label = "alias label"),
                                            tokenizedCards = listOf(
                                                    TokenizedCard(token = "card token 1", cardTail = "1234", brand = CreditCardBrand.VISA),
                                                    TokenizedCard(token = "card token 2", cardTail = "1234", brand = CreditCardBrand.MASTERCARD)
                                            )
                                    )
                            )
                            override val notifications: Notifications = Notifications(
                                    notificationEmail = "janxgodlewski@gmail.com",
                                    notificationUrl = "https://yourstore.com"
                            )
                        },
                        activity = this,
                        supportFragmentManager = supportFragmentManager
                )

// Add payment observer
                if(paymentSheet!=null) {
                    paymentSheet.addObserver(object : PaymentDelegate {
                        override fun onPaymentCreated(transactionId: String?) {}
                        override fun onPaymentCompleted(transactionId: String?) {
                            result.success(true)
                        }
                        override fun onPaymentCancelled(transactionId: String?) {}
                        override fun onModuleClosed() {}
                    })

// Open UI module
                    val sheetResult = paymentSheet.present()
                    if (sheetResult is SheetOpenResult.Success) {
                        // Module opened successfully
                    }
                }

















            }
            else {
                result.notImplemented()
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        // Where paymentSheet is a object of Payment.Sheet class
        if(paymentSheet!=null) {
            paymentSheet.onActivityResult(requestCode, resultCode, data)
        }
    }

   // override fun onBackPressed() {
       // super.onBackPressed()
      //  if(paymentSheet!=null) {
            //paymentSheet.onBackPressed()
       // }
   // }

}
