import {
  KeyboardAvoidingView,
  StyleSheet,
  Text,
  View,
  TextInput,
  TouchableOpacity,
  ActivityIndicator,
  Alert,
  Image,
} from "react-native";
import React, { useState } from "react";
import { useAuth } from "../AuthContext";

const LoginScreen = ({ navigation }) => {
  const { login } = useAuth();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [loading, setLoading] = useState(false);

  const handleLogin = async () => {
    if (!email || !password) {
      Alert.alert("Validation Error", "Please enter both email and password.");
      return;
    }

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

      if (response.ok && data.token) {
        login(data.token, data.customer); 
        navigation.navigate("Welcome"); 
      } else {
        Alert.alert("Login Failed", data.message || "Invalid credentials.");
      }
    } catch (error) {
      Alert.alert("Error", "An error occurred while logging in. Please try again.");
      console.error("Login error:", error);
    } finally {
      setLoading(false);
    }
  };

  return (
    <KeyboardAvoidingView style={styles.container} behavior="padding">
      <View style={styles.innerContainer}>
       
        <Image source={require("../assets/logo.png")} style={styles.logo} />

       
        <TextInput
          style={styles.input}
          placeholder="Email"
          value={email}
          onChangeText={(text) => setEmail(text)}
          placeholderTextColor="#afafaf"
          keyboardType="email-address"
          autoCapitalize="none"
        />

       
        <TextInput
          style={styles.input}
          placeholder="Password"
          value={password}
          onChangeText={(text) => setPassword(text)}
          placeholderTextColor="#afafaf"
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
            <ActivityIndicator size="small" color="#353535" />
          ) : (
            <Text style={styles.buttonText}>Sign In</Text>
          )}
        </TouchableOpacity>
      </View>

      <View style={styles.footer}>
        <Text style={styles.footerText}>Don’t have an account? </Text>
        <TouchableOpacity onPress={() => navigation.navigate("SignUp")}>
          <Text style={styles.signUp}>Sign Up</Text>
        </TouchableOpacity>
      </View>
    </KeyboardAvoidingView>
  );
};

export default LoginScreen;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    justifyContent: "center",
    padding: 20,
  },
  innerContainer: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
  },
  logo: {
    width: 250,
    height: 250,
    marginBottom: 20,
  },
  input: {
    backgroundColor: "#353535",
    color: "white",
    width: "100%",
    padding: 15,
    borderRadius: 5,
    marginBottom: 15,
  },
  forgotPassword: {
    color: "#353535",
    marginBottom: 30,
    textAlign: "right",
  },
  button: {
    backgroundColor: "#dbdbdb",
    padding: 15,
    borderRadius: 5,
    width: "100%",
    alignItems: "center",
    marginBottom: 20,
  },
  buttonText: {
    color: "#353535",
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
    color: "#353535",
  },
  signUp: {
    color: "#dbdbdb",
  },
});
