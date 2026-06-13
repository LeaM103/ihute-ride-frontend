import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  StyleSheet,
} from "react-native";
import { useRouter } from "expo-router";
import { useState } from "react";

export default function LoginScreen() {
  const router = useRouter();

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");

  const handleLogin = async () => {
    if (!email || !password) {
      setError("Please fill all fields");
      return;
    }

    try {
      const res = await fetch(
        "http://192.168.1.70:5000/api/auth/login",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            email,
            password,
          }),
        }
      );

      const data = await res.json();

      if (!res.ok) {
        setError(data.message || "Login failed");
        return;
      }

      setError("");
      router.push("/home");
    } catch (err) {
      setError("Cannot connect to server");
    }
  };

  return (
    <View style={styles.container}>
      <View style={styles.card}>
        <Text style={styles.title}>Rider Welfare System</Text>

        <Text style={styles.subtitle}>
          Login to continue
        </Text>

        {error ? (
          <Text style={styles.error}>
            {error}
          </Text>
        ) : null}

        <Text style={styles.label}>Email</Text>

        <TextInput
          placeholder="Enter your email"
          placeholderTextColor="#666"
          style={styles.input}
          value={email}
          onChangeText={(text) => {
            setEmail(text);
            setError("");
          }}
          keyboardType="email-address"
          autoCapitalize="none"
        />

        <Text style={styles.label}>Password</Text>

        <TextInput
          placeholder="Enter your password"
          placeholderTextColor="#666"
          style={styles.input}
          value={password}
          onChangeText={(text) => {
            setPassword(text);
            setError("");
          }}
          secureTextEntry
        />

        <TouchableOpacity
          style={styles.button}
          onPress={handleLogin}
        >
          <Text style={styles.buttonText}>
            Login
          </Text>
        </TouchableOpacity>

        <TouchableOpacity
          onPress={() => router.push("/register" as any)}
        >
          <Text style={styles.link}>
            Don't have an account? Register
          </Text>
        </TouchableOpacity>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#f5f7fb",
    justifyContent: "center",
    padding: 20,
  },

  card: {
    backgroundColor: "#fff",
    borderRadius: 20,
    padding: 25,
    shadowColor: "#000",
    shadowOpacity: 0.1,
    shadowRadius: 10,
    elevation: 5,
  },

  title: {
    fontSize: 28,
    fontWeight: "bold",
    textAlign: "center",
    color: "#1e90ff",
  },

  subtitle: {
    textAlign: "center",
    color: "gray",
    marginTop: 5,
    marginBottom: 20,
  },

  error: {
    color: "red",
    textAlign: "center",
    marginBottom: 15,
    fontWeight: "500",
  },

  label: {
    marginBottom: 6,
    color: "#333",
    fontWeight: "600",
  },

  input: {
    borderWidth: 1,
    borderColor: "#ddd",
    backgroundColor: "#fafafa",
    borderRadius: 12,
    padding: 14,
    marginBottom: 15,
    color: "#000",
  },

  button: {
    backgroundColor: "#1e90ff",
    padding: 15,
    borderRadius: 12,
    alignItems: "center",
    marginTop: 10,
  },

  buttonText: {
    color: "white",
    fontWeight: "bold",
    fontSize: 16,
  },

  link: {
    textAlign: "center",
    color: "#1e90ff",
    marginTop: 15,
    fontWeight: "500",
  },
});