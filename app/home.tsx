import { View, Text, StyleSheet, TouchableOpacity } from "react-native";
import { useRouter } from "expo-router";
import AsyncStorage from "@react-native-async-storage/async-storage";

export default function HomeScreen() {
  const router = useRouter();

  // 🚪 LOGOUT FUNCTION
  const handleLogout = async () => {
    await AsyncStorage.removeItem("token");
    router.replace("/login");
  };

  return (
    <View style={styles.container}>
      {/* TITLE */}
      <Text style={styles.title}>Rider Welfare System</Text>

      <Text style={styles.subtitle}>
        Select your role to continue
      </Text>

      {/* BUTTONS */}
      <TouchableOpacity
        style={styles.button}
        onPress={() => router.push("/rider")}
      >
        <Text style={styles.buttonText}>🚴 Rider</Text>
      </TouchableOpacity>

      <TouchableOpacity
        style={styles.button}
        onPress={() => router.push("/insurance")}
      >
        <Text style={styles.buttonText}>🛡 Insurance Company</Text>
      </TouchableOpacity>

      <TouchableOpacity
        style={styles.button}
        onPress={() => router.push("/savings")}
      >
        <Text style={styles.buttonText}>💰 Savings & Loan</Text>
      </TouchableOpacity>

      <TouchableOpacity
        style={styles.button}
        onPress={() => router.push("/bike")}
      >
        <Text style={styles.buttonText}>🏍 Bike Company</Text>
      </TouchableOpacity>

      {/* 🚪 LOGOUT (FORCED VISIBILITY FIX) */}
      <TouchableOpacity onPress={handleLogout} style={styles.logoutButton}>
        <Text style={styles.logoutText}>🚪 Logout</Text>
      </TouchableOpacity>
    </View>
  );
}

// 🎨 STYLES
const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    padding: 20,
    backgroundColor: "#f5f7fb",
  },

  title: {
    fontSize: 26,
    fontWeight: "bold",
    textAlign: "center",
    color: "#1e90ff",
    marginBottom: 5,
  },

  subtitle: {
    textAlign: "center",
    color: "gray",
    marginBottom: 30,
  },

  button: {
    backgroundColor: "#1e90ff",
    padding: 15,
    borderRadius: 10,
    marginBottom: 12,
    alignItems: "center",
  },

  buttonText: {
    color: "white",
    fontWeight: "bold",
  },

  logoutButton: {
    backgroundColor: "red",
    padding: 15,
    borderRadius: 10,
    marginTop: 25,
    alignItems: "center",
  },

  logoutText: {
    color: "white",
    fontWeight: "bold",
  },
});