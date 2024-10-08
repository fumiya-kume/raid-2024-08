package system.kuu.raid

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.activity.viewModels
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import dagger.hilt.android.AndroidEntryPoint
import system.kuu.raid.main.MainScreen
import system.kuu.raid.main.MainViewModel
import system.kuu.raid.main.MainViewModelImpl
import system.kuu.raid.ui.theme.RaidApplicationTheme

@AndroidEntryPoint
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            RaidApplicationTheme {
                val navController = rememberNavController()
                NavHost(
                    startDestination = NavigationDestination.MAIN,
                    navController = navController
                ) {
                    composable(NavigationDestination.MAIN) {
                        val viewModel: MainViewModelImpl by viewModels()
                        MainScreen(viewModel)
                    }
                }
            }
        }
    }
}

object NavigationDestination {
    const val MAIN = "main"
}