import * as React from 'react';
import {createDrawerNavigator} from '@react-navigation/drawer';

import HomeScreen from './Home';
import SelectCategory from './SelectCategory';
import ViewComplaint from './ViewComplaints';
import AddComplaint from './AddComplaint';

const Drawer = createDrawerNavigator();

export default function App() {
  return (
    <Drawer.Navigator initialRouteName="Home">
      <Drawer.Screen name="Home" component={HomeScreen} />
      <Drawer.Screen name="SelectCategory" component={SelectCategory} />
      <Drawer.Screen name="ViewComplaint" component={ViewComplaint} />
      {/* <Drawer.Screen
        name="AddComplaint"
        drawerContentOptions={{
          drawerLabel: () => null,
        }}
        component={AddComplaint}
      /> */}
    </Drawer.Navigator>
  );
}
