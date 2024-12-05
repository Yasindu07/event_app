import React, { useEffect, useState } from "react";
import Icon from "react-native-vector-icons/FontAwesome";
import {
  StyleSheet,
  Text,
  View,
  FlatList,
  ActivityIndicator,
  TouchableOpacity,
  Modal,
  Image,
  Pressable,
  TextInput,
} from "react-native";
import { useAuth } from "../AuthContext";

const WelcomeScreen = ({ navigation }) => {
  const { user } = useAuth();
  const [events, setEvents] = useState([]);
  const [loading, setLoading] = useState(true);
  const [modalVisible, setModalVisible] = useState(false);
  const [selectedEvent, setSelectedEvent] = useState(null);
  const [searchText, setSearchText] = useState("");

  useEffect(() => {
    fetchEvents();
  }, []);

  const fetchEvents = async () => {
    try {
      const response = await fetch("http://localhost:8000/api/events");
      const data = await response.json();
      setEvents(data);
    } catch (error) {
      console.error("Error fetching events:", error);
    } finally {
      setLoading(false);
    }
  };

  const handleEventPress = (event) => {
    setSelectedEvent(event);
    setModalVisible(true);
  };

  const renderItem = ({ item }) => (
    <TouchableOpacity
      onPress={() => handleEventPress(item)}
      style={styles.card}
    >
      <Image source={{ uri: item.imageUrl }} style={styles.image} />
      <View style={styles.textContainer}>
        <Text style={styles.name}>{item.name}</Text>
        <Text style={styles.title}>{item.date}</Text>
        <Text style={styles.title}>{item.location}</Text>
      </View>
    </TouchableOpacity>
  );

  const handleSearch = (text) => {
    setSearchText(text);
  };

  const filteredEvents = events.filter(
    (event) =>
      event.name.toLowerCase().includes(searchText.toLowerCase()) ||
      event.location.toLowerCase().includes(searchText.toLowerCase())
  );

  return (
    <View style={styles.container}>
      <Text style={styles.userName}>{`Hello, ${user.name}`}</Text>

      <TouchableOpacity
        style={styles.profileButton}
        onPress={() => navigation.navigate("Profile")}
      >
        <Icon name="user-circle" style={styles.profileIcon} />
      </TouchableOpacity>
      
      <TextInput
        style={styles.searchInput}
        placeholder="Search events..."
        placeholderTextColor="#C0C0C0"
        value={searchText}
        onChangeText={handleSearch}
      />

      {loading ? (
        <ActivityIndicator size="large" color="#7c7c7c" />
      ) : (
        <FlatList
          data={filteredEvents}
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
              <Text style={styles.modalTitle}>
                Location: {selectedEvent.location}
              </Text>
              <Text style={styles.modalDescription}>
                {selectedEvent.description}
              </Text>
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
    backgroundColor: "#fefefe",
    paddingTop: 90,
    paddingHorizontal: 15,
  },
  userName: {
    position: "absolute",
    top: 40,
    left: 15,
    color: "#353535",
    fontSize: 18,
    fontWeight: "bold",
  },
  profileButton: {
    position: "absolute",
    top: 40,
    right: 15,
    zIndex: 1,
  },
  profileIcon: {
    color: "#7c7c7c",
    fontSize: 40,
  },
  list: {
    paddingHorizontal: 20,
    paddingVertical: 10,
    
  },
  searchInput: {
    backgroundColor: "#7c7c7c",
    color: "#C0C0C0",
    borderRadius: 20,
    paddingLeft: 15,
    paddingVertical: 10,
    marginBottom: 30,
    fontSize: 16,
  },
  card: {
    backgroundColor: "#dbdbdb",
    borderRadius: 10,
    flexDirection: "row",
    marginBottom: 15,
    padding: 10,
    alignItems: "center",
    shadowColor: "#000",
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.8,
    shadowRadius: 4,
    elevation: 5,
  },
  image: {
    width: 60,
    height: 60,
    borderRadius: 30,
    marginRight: 15,
  },
  textContainer: {
    flex: 1,
  },
  name: {
    color: "#353535",
    fontSize: 20,
    fontWeight: "bold",
  },
  title: {
    color: "#7c7c7c",
    fontSize: 16,
  },
  modalContainer: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "rgba(0, 0, 0, 0.6)",
  },
  modalView: {
    margin: 20,
    backgroundColor: "#3D3D3D",
    borderRadius: 20,
    padding: 35,
    alignItems: "center",
    shadowColor: "#000",
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.8,
    shadowRadius: 4,
    elevation: 5,
  },
  modalName: {
    color: "#fff",
    fontSize: 24,
    fontWeight: "bold",
    marginBottom: 10,
  },
  modalTitle: {
    color: "#7c7c7c",
    fontSize: 18,
    marginBottom: 5,
  },
  modalDescription: {
    color: "#7c7c7c",
    fontSize: 16,
    marginBottom: 10,
  },
  button: {
    borderRadius: 20,
    padding: 10,
    elevation: 2,
  },
  buttonClose: {
    backgroundColor: "#fefefe",
  },
  textStyle: {
    color: "#222",
    fontWeight: "bold",
    textAlign: "center",
  },
});
