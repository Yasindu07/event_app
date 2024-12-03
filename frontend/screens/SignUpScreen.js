import React, { useState } from 'react';
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
import { useAuth } from "../AuthContext";

const SignUpScreen = ({ navigation }) => {
  const { login } = useAuth();
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState("");
  const [passwordCriteria, setPasswordCriteria] = useState({
    lowercase: false,
    uppercase: false,
    number: false,
    minLength: false,
  });
  const [loading, setLoading] = useState(false);

  const validatePassword = (pwd) => {
    setPasswordCriteria({
      lowercase: /[a-z]/.test(pwd),
      uppercase: /[A-Z]/.test(pwd),
      number: /[0-9]/.test(pwd),
      minLength: pwd.length >= 6,
    });
  };

  const handleSignUp = async () => {
    setLoading(true);
  
    if (password !== confirmPassword) {
      Alert.alert('Error', 'Passwords do not match!');
      setLoading(false);
      return;
    }
  
    try {
      const response = await fetch('http://localhost:8000/api/register', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          name,
          email,
          password,
          password_confirmation: confirmPassword,
        }),
      });
  
      // Check if the response is okay and if it's JSON
      const responseText = await response.text();
      let data;
  
      try {
        data = JSON.parse(responseText);
      } catch (error) {
        console.error("Error parsing JSON:", error);
        Alert.alert('Error', 'Failed to parse server response');
        return;
      }
  
      if (!response.ok) {
        
        Alert.alert('Error', `HTTP error! Status: ${response.status}`);
        return;
      }
  
      console.log("Response Data:", data);
      
      if (data.token) {
        navigation.navigate('Welcome');
        console.log('Registration successful:', data);
        login(data.token, data.user);  
      } else {
        
        Alert.alert('Error', data.message || 'Failed to register');
      }
    } catch (error) {
      console.error('Error during registration:', error);
      Alert.alert('Error', 'There was an error during registration');
    }
  
    setLoading(false);
  };
  
  
  return(
    <KeyboardAvoidingView style={styles.container} behavior="padding">
      <View style={styles.innerContainer}>
        <Text style={styles.title}>Event_LK</Text>
        <TextInput
          style={styles.input}
          placeholder="Name"
          placeholderTextColor="#C0C0C0"
          autoCapitalize="words"
          value={name}
          onChangeText={(text) => setName(text)}
        />
        <TextInput
          style={styles.input}
          placeholder="Email Address"
          placeholderTextColor="#C0C0C0"
          keyboardType="email-address"
          autoCapitalize="none"
          value={email}
          onChangeText={(text) => setEmail(text)}
        />
        <TextInput
          style={styles.input}
          placeholder="Password"
          placeholderTextColor="#C0C0C0"
          secureTextEntry
          value={password}
          onChangeText={(text) => {
            setPassword(text);
            validatePassword(text);
          }}
        />
        <TextInput
          style={styles.input}
          placeholder="Confirm Password"
          placeholderTextColor="#C0C0C0"
          secureTextEntry
          value={confirmPassword}
          onChangeText={(text) => setConfirmPassword(text)}
        />
        <View style={styles.passwordCriteriaContainer}>
          <Text style={styles.passwordCriteriaText}>
            {passwordCriteria.lowercase ? "✔️" : "❌"} One lowercase character
          </Text>
          <Text style={styles.passwordCriteriaText}>
            {passwordCriteria.uppercase ? "✔️" : "❌"} One uppercase character
          </Text>
          <Text style={styles.passwordCriteriaText}>
            {passwordCriteria.number ? "✔️" : "❌"} One number
          </Text>
          <Text style={styles.passwordCriteriaText}>
            {passwordCriteria.minLength ? "✔️" : "❌"} 6 characters minimum
          </Text>
        </View>
        <TouchableOpacity style={styles.button} onPress={handleSignUp} disabled={loading}>
          <>
            {loading ? (<ActivityIndicator size="small" color="#222" />) : (
              <Text style={styles.buttonText}>Sign Up</Text>
            )}
          </>
        </TouchableOpacity>
      </View>
      <View style={styles.footer}>
        <Text style={styles.footerText}>Have an account? </Text>
        <TouchableOpacity onPress={() => navigation.navigate("Login")}>
          <Text style={styles.signIn}>Sign In</Text>
        </TouchableOpacity>
      </View>
    </KeyboardAvoidingView>
  );
};

export default SignUpScreen;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#2A2A2A",
    justifyContent: "center",
    padding: 20,
  },
  innerContainer: {
    flex: 1,
    justifyContent: 'center',
  },
  title: {
    textAlign: 'center',
    color: "white",
    fontSize: 24,
    marginBottom: 20,
  },
  input: {
    backgroundColor: "#3D3D3D",
    color: "white",
    width: "100%",
    padding: 15,
    borderRadius: 5,
    marginBottom: 15,
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
  signIn: {
    color: "#FFD482",
  },
  passwordCriteriaContainer: {
    alignSelf: "flex-start",
    marginBottom: 20,
  },
  passwordCriteriaText: {
    color: "#888",
  },
});
