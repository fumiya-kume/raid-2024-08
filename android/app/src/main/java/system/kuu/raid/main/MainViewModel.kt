package system.kuu.raid.main

import androidx.lifecycle.ViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharedFlow
import kotlinx.coroutines.flow.StateFlow

data class MainState(
    val title: String,
)

sealed class MainNavigationAction{

}

interface MainViewModel {
    val state: StateFlow<MainState>
    val navigationAction: SharedFlow<MainNavigationAction>
}

@HiltViewModel
class MainViewModelImpl @Inject constructor() : MainViewModel, ViewModel() {
    override val state: MutableStateFlow<MainState> = MutableStateFlow(MainState(""))
    override val navigationAction: MutableSharedFlow<MainNavigationAction> = MutableSharedFlow()
}