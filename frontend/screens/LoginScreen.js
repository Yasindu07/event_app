import {
  KeyboardAvoidingView,
  StyleSheet,
  Text,
  View,
  TextInput,
  TouchableOpacity,
  ActivityIndicator,
  Alert,
} from "react-native";
import React, { useState, useContext } from "react";
import { useAuth } from "../AuthContext";

const LoginScreen = ({ navigation }) => {
  const { login } = useAuth();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [loading, setLoading] = useState(false);

  const handleLogin = async () => {
    setLoading(true);

    try {
      const response = await fetch("http://localhost:8000/api/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          email,
          password,
        }),
      });

      const data = await response.json();
      console.log("Login successful", data);

     
      if (data.token && data.message === "Login successful") {
        navigation.navigate("Welcome");
        console.log("Login successful", data);
        login(data.token, data.customer);
      } else {
        Alert.alert("Error", "Login failed");
      }
    } catch (error) {
      Alert.alert("Error", "There was an error during login");
    }

    setLoading(false);
  };

  return (
    <KeyboardAvoidingView style={styles.container} behavior="padding">
      <View style={styles.innerContainer}>
        <Text style={styles.title}>EVENT_LK</Text>
        <TextInput
          style={styles.input}
          placeholder="Email"
          value={email}
          onChangeText={(text) => setEmail(text)}
          placeholderTextColor="#C0C0C0"
          keyboardType="email-address"
          autoCapitalize="none"
        />
        <TextInput
          style={styles.input}
          placeholder="Password"
          value={password}
          onChangeText={(text) => setPassword(text)}
          placeholderTextColor="#C0C0C0"
          secureTextEntry
        />
        <TouchableOpacity>
          <Text style={styles.forgotPassword}>Forgot Password?</Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={styles.button}
          onPress={handleLogin}
          disabled={loading}
        >
          {loading ? (
            <ActivityIndicator size="small" color="#222" />
          ) : (
            <Text style={styles.buttonText}>Sign In</Text>
          )}
        </TouchableOpacity>
      </View>
      <View style={styles.footer}>
        <Text style={styles.footerText}>Don’t have an account? </Text>
        <TouchableOpacity>
          <Text
            style={styles.signUp}
            onPress={() => navigation.navigate("SignUp")}
          >
            Sign Up
          </Text>
        </TouchableOpacity>
      </View>
    </KeyboardAvoidingView>
  );
};

export default LoginScreen;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#2A2A2A",
    justifyContent: "center",
    padding: 20,
  },
  innerContainer: {
    flex: 1,
    justifyContent: "center",
  },
  title: {
    textAlign: "center",
    color: "white",
    fontSize: 24,
    marginBottom: 80,
  },
  input: {
    backgroundColor: "#3D3D3D",
    color: "white",
    width: "100%",
    padding: 15,
    borderRadius: 5,
    marginBottom: 15,
  },
  forgotPassword: {
    color: "#FFFFFF",
    textAlign: "right",
    marginBottom: 30,
  },
  button: {
    backgroundColor: "#FFD482",
    padding: 15,
    borderRadius: 5,
    width: "100%",
    alignItems: "center",
    marginBottom: 20,
  },
  buttonText: {
    color: "#222",
    fontSize: 16,
    fontWeight: "bold",
  },
  footer: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "center",
    paddingBottom: 20,
  },
  footerText: {
    color: "white",
  },
  signUp: {
    color: "#FFD482",
  },
});
