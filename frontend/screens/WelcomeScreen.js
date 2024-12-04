import React, { useEffect, useState } from 'react';
import {
  StyleSheet,
  Text,
  View,
  FlatList,
  ActivityIndicator,
  TouchableOpacity,
  Modal,
  Pressable
} from 'react-native';

const WelcomeScreen = ({ navigation }) => {
  const [events, setEvents] = useState([]); 
  const [loading, setLoading] = useState(true);
  const [modalVisible, setModalVisible] = useState(false);
  const [selectedEvent, setSelectedEvent] = useState(null);

  useEffect(() => {
    fetchEvents(); 
  }, []);

  const fetchEvents = async () => {
    try {
      const response = await fetch('http://localhost:8000/api/events');
      const data = await response.json();
      setEvents(data); 
    } catch (error) {
      console.error('Error fetching events:', error);
    } finally {
      setLoading(false); 
    }
  };

  const handleEventPress = (event) => {
    setSelectedEvent(event);
    setModalVisible(true);
  };

  const renderItem = ({ item }) => (
    <TouchableOpacity onPress={() => handleEventPress(item)} style={styles.card}>
      <View style={styles.textContainer}>
        <Text style={styles.name}>{item.name}</Text>
        <Text style={styles.title}>{item.date}</Text>
        <Text style={styles.title}>{item.location}</Text>
      </View>
    </TouchableOpacity>
  );

  return (
    <View style={styles.container}>
      {/* Profile Icon Button */}
      <TouchableOpacity 
        style={styles.profileButton} 
        onPress={() => navigation.navigate("Profile")}
      >
        <Text style={styles.profileIcon}>👤</Text>
      </TouchableOpacity>

      {loading ? (
        <ActivityIndicator size="large" color="#FFD700" />
      ) : (
        <FlatList
          data={events}
          renderItem={renderItem}
          keyExtractor={(item) => item.id.toString()}
          contentContainerStyle={styles.list}
        />
      )}

      {selectedEvent && (
        <Modal
          animationType="slide"
          transparent={true}
          visible={modalVisible}
          onRequestClose={() => setModalVisible(!modalVisible)}
        >
          <View style={styles.modalContainer}>
            <View style={styles.modalView}>
              <Text style={styles.modalName}>{selectedEvent.name}</Text>
              <Text style={styles.modalTitle}>Date: {selectedEvent.date}</Text>
              <Text style={styles.modalTitle}>Location: {selectedEvent.location}</Text>
              <Text style={styles.modalDescription}>{selectedEvent.description}</Text>
              <Pressable
                style={[styles.button, styles.buttonClose]}
                onPress={() => setModalVisible(!modalVisible)}
              >
                <Text style={styles.textStyle}>Close</Text>
              </Pressable>
            </View>
          </View>
        </Modal>
      )}
    </View>
  );
};

export default WelcomeScreen;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#2A2A2A',
    paddingTop: 40,
    paddingHorizontal: 15,
  },
  profileButton: {
    position: 'absolute',
    top: 40,
    right: 15,
    zIndex: 1,
  },
  profileIcon: {
    fontSize: 30,
    color: '#FFD700',
  },
  list: {
    marginTop: 70,
    paddingBottom: 20,
  },
  card: {
    backgroundColor: '#3D3D3D',
    borderRadius: 12,
    flexDirection: 'row',
    marginBottom: 15,
    padding: 15,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.8,
    shadowRadius: 4,
    elevation: 5,
  },
  textContainer: {
    flex: 1,
  },
  name: {
    color: '#FFD700',
    fontSize: 20,
    fontWeight: 'bold',
  },
  title: {
    color: '#C0C0C0',
    fontSize: 16,
  },
  modalContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'rgba(0, 0, 0, 0.6)',
  },
  modalView: {
    margin: 20,
    backgroundColor: '#3D3D3D',
    borderRadius: 20,
    padding: 35,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.8,
    shadowRadius: 4,
    elevation: 5,
  },
  modalName: {
    color: '#FFD700',
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 10,
  },
  modalTitle: {
    color: '#C0C0C0',
    fontSize: 18,
    marginBottom: 5,
  },
  modalDescription: {
    color: '#C0C0C0',
    fontSize: 16,
    marginBottom: 10,
  },
  button: {
    borderRadius: 20,
    padding: 10,
    elevation: 2,
  },
  buttonClose: {
    backgroundColor: '#FFD700',
  },
  textStyle: {
    color: '#222',
    fontWeight: 'bold',
    textAlign: 'center',
  },
});
