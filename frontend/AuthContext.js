import React, {createContext, useState, useContext} from 'react'

const AuthContext = createContext();

export const useAuth = () => {
  return useContext(AuthContext);
}

export const AuthProvider = ({children}) => {
  const [user, setUser] = useState(null);
  const [token, setToken] = useState(null);

  const login = (token, user) => {
    setToken(token);
    setUser(user);
  };

  const logout = () => {
    setToken(null);
    setUser(null);
  };

  return (
    <AuthContext.Provider value={{ user, token, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
}