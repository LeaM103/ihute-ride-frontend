import { View, Text, StyleSheet } from "react-native";

export default function BikeDashboard() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>🏍 Bike Company Dashboard</Text>

      <Text style={styles.item}>✔ Bike Maintenance Records</Text>
      <Text style={styles.item}>✔ Spare Parts Requests</Text>
      <Text style={styles.item}>✔ Fleet Monitoring</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: 20, justifyContent: "center" },
  title: { fontSize: 22, fontWeight: "bold", marginBottom: 20 },
  item: { fontSize: 16, marginBottom: 10 },
});