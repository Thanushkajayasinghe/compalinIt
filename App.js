import * as React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createStackNavigator} from '@react-navigation/stack';

import Splash from './src/Splash';
import ChangeLang from './src/ChangeLang';
import BeforeLogin from './src/BeforeLogin';
import SignIn from './src/SignIn';
import SignUp from './src/SignUp';
import DrawerNav from './src/Drawer';
import Home from './src/Home';
import ViewComplaint from './src/ViewComplaints';
import ViewComplaintStatus from './src/ViewComplainStatus';
import SelectCategory from './src/SelectCategory'
import AddComplaint from './src/AddComplaint'

const Stack = createStackNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Splash">
        <Stack.Screen
          name="Splash"
          component={Splash}
          options={{headerShown: false}}
        />
        <Stack.Screen
          name="ChangeLang"
          component={ChangeLang}
          options={{headerShown: false}}
        />
        <Stack.Screen
          name="BeforeLogin"
          component={BeforeLogin}
          options={{headerShown: false}}
        />
        <Stack.Screen
          name="SignIn"
          component={SignIn}
          options={{headerShown: false}}
        />
        <Stack.Screen
          name="SignUp"
          component={SignUp}
          options={{headerShown: false}}
        />
        <Stack.Screen
          name="DrawerNav"
          component={DrawerNav}
          options={{headerShown: false}}
        />
        <Stack.Screen
          name="Home"
          component={Home}
          options={{headerShown: false}}
        />
        <Stack.Screen
          name="ViewComplaint"
          component={ViewComplaint}
          options={{headerShown: false}}
        />
        <Stack.Screen
          name="ViewComplaintStatus"
          component={ViewComplaintStatus}
          options={{headerShown: false}}
        />
        <Stack.Screen
          name="SelectCategory"
          component={SelectCategory}
          options={{headerShown: false}}
        />
         <Stack.Screen
          name="AddComplaint"
          component={AddComplaint}
          options={{headerShown: false}}
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
}
