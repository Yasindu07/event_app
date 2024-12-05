import React, { useContext, useEffect } from 'react';
import { StyleSheet, Text, View, TextInput, TouchableOpacity } from 'react-native';
import { useAuth } from '../AuthContext';
import { Ionicons } from '@expo/vector-icons'; 

const ProfileScreen = ({ navigation }) => {
  const { user, logout } = useAuth(); 

  useEffect(() => {
    if (!user) {
      navigation.navigate('Login'); 
    }
  }, [user, navigation]); 

  const handleLogout = () => {
    logout(); 
    navigation.navigate('Login'); 
  };

  if (!user) {
    return null;
  }

  return (
    <View style={styles.container}>
      
      <TouchableOpacity 
        style={styles.backButton} 
        onPress={() => navigation.navigate('Welcome')} 
      >
        <Ionicons name="arrow-back" style={styles.back_arrow} />
      </TouchableOpacity>

      <Text style={styles.title}>Profile</Text>

      
      <TextInput
        style={styles.input}
        value={user.name || ''}
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

      
      <TouchableOpacity style={styles.button} onPress={handleLogout}>
        <Text style={styles.buttonText}>Log out</Text>
      </TouchableOpacity>
    </View>
  );
};

export default ProfileScreen;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',  
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },
  backButton: {
    position: 'absolute',
    color: '#030303',
    top: 40,
    left: 15,
    zIndex: 1,
  },
  title: {
    color: '#353535',  
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 30,
  },
  input: {
    backgroundColor: '#afafaf', 
    color: '#353535',  
    width: '100%',
    padding: 15,
    borderRadius: 10,
    marginBottom: 15,
    fontSize: 16,
  },
  button: {
    backgroundColor: '#353535',  
    padding: 15,
    borderRadius: 10,
    width: '100%',
    alignItems: 'center',
    marginTop: 20,
  },
  buttonText: {
    color: '#fefefe',  
    fontSize: 16,
    fontWeight: 'bold',
  },
  back_arrow: {
    color: "#FFD482",
    fontSize: 40,
  },
});
