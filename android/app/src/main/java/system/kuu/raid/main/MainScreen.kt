package system.kuu.raid.main

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Button
import androidx.compose.material3.FilledTonalButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import system.kuu.raid.ui.theme.RaidApplicationTheme

@Composable
fun MainScreen() {
    Scaffold { contentPadding ->
        Box(modifier = Modifier.padding(contentPadding)
        ) {
            Greeting("Android")
        }
    }
}

@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Column(modifier = modifier) {
        Box(modifier = Modifier
            .weight(1f)
            .background(Color.Gray)
        )
        Row {
            Button(
                shape = RoundedCornerShape(12.dp),
                onClick = { /*TODO*/ },
                modifier = Modifier
                    .weight(1f)
                    .padding(4.dp)
            ) {
                Text(text = "🪨 Rock")
            }
            Button(
                shape = RoundedCornerShape(12.dp),
                onClick = { /*TODO*/ },
                modifier = Modifier
                    .weight(1f)
                    .padding(4.dp)
            ) {
                Text(text = "📃 Paper")
            }
            Button(
                shape = RoundedCornerShape(12.dp),
                onClick = { /*TODO*/ },
                modifier = Modifier
                    .weight(1f)
                    .padding(4.dp)
            ) {
                Text(text = "✂️ Scissors")
            }
        }
        FilledTonalButton(
            onClick = {},
            shape = RoundedCornerShape(12.dp),
            modifier = Modifier
                .padding(4.dp)
                .fillMaxWidth()
        ) {
            Text(style = MaterialTheme.typography.displaySmall, text = "Battle ⚔️")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    RaidApplicationTheme {
        Greeting("Android")
    }
}