import { View, Text, TextInput, TouchableOpacity, StyleSheet } from "react-native";
import { useRouter } from "expo-router";
import { useState } from "react";

export default function RegisterScreen() {
  const router = useRouter();

  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");

  const handleRegister = async () => {
    // 1. Validate empty fields
    if (!name || !email || !password) {
      setError("⚠️ Please fill all fields");
      return;
    }

    // 2. Basic validation
    if (password.length < 4) {
      setError("⚠️ Password must be at least 4 characters");
      return;
    }

    try {
      // 3. Call backend register API
      const res = await fetch("http://192.168.1.70:5000/api/auth/register", {
        method: "POST",
        headers: {
        "Content-Type": "application/json",
        },
        body: JSON.stringify({
          name,
          email,
          password,
        }),
      });

      const data = await res.json();

      // 4. Handle backend errors
      if (!res.ok) {
        setError(data.message || "Registration failed");
        return;
      }

      // 5. Success
      setError("");
      router.push("/home");

    } catch (err) {
      setError("❌ Cannot connect to server");
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Create Account</Text>
      <Text style={styles.subtitle}>Join Ihute Ride Welfare System</Text>

      {/* ERROR MESSAGE */}
      {error ? (
        <Text style={styles.errorText}>{error}</Text>
      ) : null}

      {/* Name */}
      <Text style={styles.label}>Full Name</Text>
      <TextInput
        placeholder="Enter your full name"
        placeholderTextColor="#999"
        style={styles.input}
        value={name}
        onChangeText={(text) => {
          setName(text);
          setError("");
        }}
      />

      {/* Email */}
      <Text style={styles.label}>Email</Text>
      <TextInput
        placeholder="Enter your email"
        placeholderTextColor="#999"
        style={styles.input}
        value={email}
        onChangeText={(text) => {
          setEmail(text);
          setError("");
        }}
        keyboardType="email-address"
        autoCapitalize="none"
      />

      {/* Password */}
      <Text style={styles.label}>Password</Text>
      <TextInput
        placeholder="Enter your password"
        placeholderTextColor="#999"
        style={styles.input}
        value={password}
        onChangeText={(text) => {
          setPassword(text);
          setError("");
        }}
        secureTextEntry
      />

      {/* Button */}
      <TouchableOpacity style={styles.button} onPress={handleRegister}>
        <Text style={styles.buttonText}>Register</Text>
      </TouchableOpacity>

      {/* Link */}
      <TouchableOpacity onPress={() => router.push("/login" as any)}>
        <Text style={styles.link}>
          Already have an account? Login
        </Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    padding: 20,
    backgroundColor: "#fff",
  },

  title: {
    fontSize: 30,
    fontWeight: "bold",
    textAlign: "center",
    color: "#1e90ff",
    marginBottom: 5,
  },

  subtitle: {
    textAlign: "center",
    marginBottom: 20,
    color: "gray",
  },

  errorText: {
    color: "red",
    textAlign: "center",
    marginBottom: 15,
    fontWeight: "500",
  },

  label: {
    marginBottom: 6,
    fontWeight: "500",
    color: "#333",
  },

  input: {
    borderWidth: 1,
    borderColor: "#ddd",
    padding: 12,
    marginBottom: 15,
    borderRadius: 10,
    backgroundColor: "#fafafa",
  },

  button: {
    backgroundColor: "#1e90ff",
    padding: 15,
    borderRadius: 10,
    alignItems: "center",
    marginTop: 10,
  },

  buttonText: {
    color: "white",
    fontWeight: "bold",
  },

  link: {
    marginTop: 20,
    textAlign: "center",
    color: "#1e90ff",
    fontWeight: "500",
  },
});