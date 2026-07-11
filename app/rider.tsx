import { View, Text, StyleSheet } from "react-native";

export default function RiderDashboard() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>🚴 Rider Dashboard</Text>

      <Text style={styles.item}>✔ Profile Management</Text>
      <Text style={styles.item}>✔ Accident Reporting</Text>
      <Text style={styles.item}>✔ Welfare Requests</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: 20, justifyContent: "center" },
  title: { fontSize: 22, fontWeight: "bold", marginBottom: 20 },
  item: { fontSize: 16, marginBottom: 10 },
});