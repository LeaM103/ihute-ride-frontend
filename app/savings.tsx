import { View, Text, StyleSheet } from "react-native";

export default function SavingsDashboard() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>💰 Savings & Loan Dashboard</Text>

      <Text style={styles.item}>✔ Rider Savings Accounts</Text>
      <Text style={styles.item}>✔ Loan Requests</Text>
      <Text style={styles.item}>✔ Repayment Tracking</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: 20, justifyContent: "center" },
  title: { fontSize: 22, fontWeight: "bold", marginBottom: 20 },
  item: { fontSize: 16, marginBottom: 10 },
});