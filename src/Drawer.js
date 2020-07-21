import * as React from 'react';
import {createBottomTabNavigator} from '@react-navigation/bottom-tabs';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import i18n from './i18n/locales/locale';

import HomeScreen from './Home';
import SelectCategory from './SelectCategory';

const Tab = createBottomTabNavigator();

export default function App() {
  return (
    <Tab.Navigator
      screenOptions={({route}) => ({
        tabBarIcon: ({focused, color, size}) => {
          let iconName;

          if (route.name === 'Home') {
            iconName = focused ? 'home-city' : 'home-city-outline';
          } else if (route.name === 'New Complain') {
            iconName = focused ? 'bookmark-plus' : 'bookmark-plus-outline';
          }

          // You can return any component that you like here!
          return (
            <MaterialCommunityIcons name={iconName} size={30} color={color} />
          );
        },
      })}
      tabBarOptions={{
        activeTintColor: 'tomato',
        inactiveTintColor: 'gray',
        labelStyle: {
          fontSize: 15,
          margin: 0,
          padding: 0,
        },
        style:{height: 60}
      }}>
      <Tab.Screen name="Home" component={HomeScreen} />
      <Tab.Screen name="New Complain" component={SelectCategory} />
    </Tab.Navigator>
  );
}
