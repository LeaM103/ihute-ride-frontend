import { View, Text, StyleSheet } from "react-native";

export default function InsuranceDashboard() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>🛡 Insurance Dashboard</Text>

      <Text style={styles.item}>✔ Claims Review</Text>
      <Text style={styles.item}>✔ Rider Risk Analysis</Text>
      <Text style={styles.item}>✔ Policy Management</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: 20, justifyContent: "center" },
  title: { fontSize: 22, fontWeight: "bold", marginBottom: 20 },
  item: { fontSize: 16, marginBottom: 10 },
});