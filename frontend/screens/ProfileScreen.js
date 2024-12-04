import React, { useContext, useEffect } from 'react';
import { StyleSheet, Text, View, TextInput, TouchableOpacity } from 'react-native';
import { useAuth } from '../AuthContext';
import { Ionicons } from '@expo/vector-icons'; // Importing Ionicons for the back icon

const ProfileScreen = ({ navigation }) => {
  const { user, logout } = useAuth(); 

  useEffect(() => {
    if (!user) {
      navigation.navigate('Login'); 
    }
  }, [user, navigation]); 

  if (!user) {
    return null;
  }

  return (
    <View style={styles.container}>
      {/* Back Button */}
      <TouchableOpacity 
        style={styles.backButton} 
        onPress={() => navigation.navigate('Welcome')} // Navigate to the Welcome screen
      >
        <Ionicons name="arrow-back" size={24} color="white" />
      </TouchableOpacity>

      <Text style={styles.title}>My App</Text>
      <TextInput
        style={styles.input}
        value={user.displayName || ''}
        placeholder="Name"
        placeholderTextColor="#C0C0C0"
        editable={false}
      />
      <TextInput
        style={styles.input}
        value={user.email || ''}
        placeholder="Email"
        placeholderTextColor="#C0C0C0"
        editable={false}
      />
      <TouchableOpacity style={styles.button} onPress={logout}>
        <Text style={styles.buttonText}>Log out</Text>
      </TouchableOpacity>
    </View>
  );
};

export default ProfileScreen;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#2A2A2A',
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },
  backButton: {
    position: 'absolute',
    top: 40,
    left: 15,
    zIndex: 1,
  },
  title: {
    color: 'white',
    fontSize: 24,
    marginBottom: 20,
  },
  input: {
    backgroundColor: '#3D3D3D',
    color: 'white',
    width: '100%',
    padding: 15,
    borderRadius: 5,
    marginBottom: 15,
  },
  button: {
    backgroundColor: '#FFD482',
    padding: 15,
    borderRadius: 5,
    width: '100%',
    alignItems: 'center',
    marginTop: 20,
  },
  buttonText: {
    color: '#222',
    fontSize: 16,
    fontWeight: 'bold',
  },
});
