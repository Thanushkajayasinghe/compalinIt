import React, {Component} from 'react';
import {
  StyleSheet,
  View,
  Text,
  ImageBackground,
  Image,
  Alert,
  ScrollView,
  TouchableOpacity,
} from 'react-native';
import AwesomeButtonRick from 'react-native-really-awesome-button/src/themes/rick';
import AsyncStorage from '@react-native-community/async-storage';
import {
  Container,
  Header,
  Left,
  Body,
  Right,
  Button,
  Icon,
  Title,
  Item,
  List,
  ListItem,
} from 'native-base';
import {SearchBar} from 'react-native-elements';
import {
  widthPercentageToDP as wp,
  heightPercentageToDP as hp,
} from 'react-native-responsive-screen';
import i18n from './i18n/locales/locale';

export default class Home extends Component {
  constructor() {
    super();

    this.state = {
      username: '',
      dataSource: [],
      search: '',
    };

    i18n.locale = 'en';
  }

  async componentDidMount() {
    if ((await AsyncStorage.getItem('lang')) == null) {
      i18n.locale = 'en';
    } else {
      i18n.locale = await AsyncStorage.getItem('lang');
    }


    if ((await AsyncStorage.getItem('username')) == null) {
      this.props.navigation.navigate('BeforeLogin');
    }

    this.setState({username: await AsyncStorage.getItem('username')});

    fetch('http://123.231.114.160:3000/loadComplains/', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        username: this.state.username,
      }),
    })
      .then(response => response.json())
      .then(responseJson => {
        this.setState(
          {
            dataSource: responseJson,
          },
          function() {},
        );
      })
      .catch(error => {
        console.error(error);
      });
  }

  updateSearch = search => {
    this.setState({search});

    fetch('http://123.231.114.160:3000/searchComplain/', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        username: this.state.username,
        searchText: search,
      }),
    })
      .then(response => response.json())
      .then(responseJson => {
        this.setState(
          {
            dataSource: responseJson,
          },
          function() {},
        );
      })
      .catch(error => {
        console.error(error);
      });
  };


  onComplainPress = item => {
    this.props.navigation.navigate('ViewComplaintStatus', {
      refNo: item.refno,
    });
  };

  async logOut() {
    await AsyncStorage.removeItem('username');
    this.props.navigation.navigate('BeforeLogin');
  }

  render() {
    const {search} = this.state;

    return (
      <ImageBackground
        source={require('./Images/wer.jpg')}
        style={styles.imgBackground}>
        <Header transparent>
          <Body style={{alignItems: 'center'}}>
            <Title
              style={{color: '#000', fontSize: hp('3%'), marginTop: hp('0%')}}>
              {i18n.t('Home')}
            </Title>
          </Body>
          <Icon
            name="ios-log-out"
            style={{
              color: '#000',
              top: hp('1.5%'),
              fontSize: hp('4%'),
              fontWeight: 'bold',
            }}
            onPress={() => {
              this.logOut();
            }}
          />
        </Header>

        <SearchBar
          placeholder={i18n.t('Type Here')}
          onChangeText={this.updateSearch}
          value={search}
        />

        <ScrollView style={{marginTop: hp('2.5%')}}>
          <View style={{alignItems: 'center'}}>
            {this.state.dataSource.map((item, key) => {
              if (item.completedstatus == null || item.completedstatus == "") {
                return (
                  <List
                    style={{
                      backgroundColor: '#45aaf2',
                      borderRadius: 20,
                      borderColor: 'black',
                      borderWidth: 5,
                      marginBottom: 10,
                      width: '95%',
                      flex: 1,
                    }}
                    key={key}>
                    <ListItem avatar onPress={() => this.onComplainPress(item)}>
                      <Body>
                        <Text
                          style={{fontWeight: 'bold', fontSize: hp('2.6%')}}>
                          {item.refno}
                        </Text>
                        <Text
                          style={{fontWeight: 'bold', fontSize: hp('2.4%')}}
                          note>
                          {item.complaintitle}
                        </Text>
                        <Text style={{fontWeight: 'bold'}} note>
                          {item.cdate}
                        </Text>
                      </Body>
                      <Right>
                        <Text
                          note
                          style={{
                            fontWeight: 'bold',
                            color: 'white',
                            fontSize: hp('2%'),
                          }}>
                          {i18n.t('Pending')} 
                        </Text>
                        <Image
                          source={require('./Images/Pending.png')}
                          style={{
                            width: 50,
                            height: 50,
                            position: 'relative',
                            top: hp('1%'),
                          }}
                        />
                      </Right>
                    </ListItem>
                  </List>
                );
              } else {
                return (
                  <List
                    style={{
                      backgroundColor: '#b8e994',
                      borderRadius: 20,
                      borderColor: 'black',
                      borderWidth: 5,
                      marginBottom: 10,
                      width: '95%',
                    }}
                    key={key}>
                    <ListItem avatar>
                      <Body>
                        <Text
                          style={{fontWeight: 'bold', fontSize: hp('2.6%')}}>
                          {item.refno}
                        </Text>
                        <Text
                          style={{fontWeight: 'bold', fontSize: hp('2.4%')}}
                          note>
                          {item.complaintitle}
                        </Text>
                        <Text style={{fontWeight: 'bold'}} note>
                          {item.cdate}
                        </Text>
                      </Body>
                      <Right>
                        <Text
                          note
                          style={{fontWeight: 'bold', fontSize: hp('2%')}}>
                         {i18n.t('Completed')} 
                        </Text>
                        <Image
                          source={require('./Images/check.png')}
                          style={{
                            width: 50,
                            height: 50,
                            position: 'relative',
                            top: hp('1%'),
                          }}
                        />
                      </Right>
                    </ListItem>
                  </List>
                );
              }
            })}
          </View>
        </ScrollView>
      </ImageBackground>
    );
  }
}

const styles = StyleSheet.create({
  imgBackground: {
    flex: 1,
    width: null,
    height: null,
  },
});
