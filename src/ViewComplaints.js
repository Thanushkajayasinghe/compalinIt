import React, {Component} from 'react';
import {View, StyleSheet, ScrollView, Image} from 'react-native';
import {
  Container,
  Header,
  Left,
  Body,
  Right,
  Button,
  Icon,
  Title,
  Content,
  List,
  ListItem,
  Text,
} from 'native-base';
import AsyncStorage from '@react-native-community/async-storage';

export default class ViewComplaints extends Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
      dataSource: [],
    };
  }

  async componentDidMount() {
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
        console.log(responseJson);
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

  render() {
    return (
      <Container>
        <Header style={{marginTop: 25}}>
          <Left>
            <Button transparent onPress={() => this.props.navigation.goBack()}>
              <Icon name="arrow-back" />
            </Button>
          </Left>
          <Body>
            <Title>View Complains</Title>
          </Body>
          <Right>
            <Button
              transparent
              onPress={() => {
                this.props.navigation.toggleDrawer();
              }}>
              <Icon name="menu" />
            </Button>
          </Right>
        </Header>

        <Content padder>
          {this.state.dataSource.map((item, key) => (
            <List
              style={{
                backgroundColor: '#45aaf2',
                borderRadius: 20,
                borderColor: 'black',
                borderWidth: 5,
                marginBottom: 10,
              }}>
              <ListItem avatar>
                <Body>
                  <Text style={{fontWeight: 'bold'}}>{item.refno}</Text>
                  <Text note style={{color: 'white'}}>
                    {item.complaintitle}
                  </Text>
                </Body>
                <Right>
                  <Text note style={{fontWeight: 'bold', color: 'white'}}>
                    Pending
                  </Text>
                  <Image
                    source={require('./Images/Pending.png')}
                    style={{
                      width: 50,
                      height: 50,
                      position: 'relative',
                      left: 2,
                    }}
                  />
                </Right>
              </ListItem>
            </List>
          ))}

          <List
            style={{
              backgroundColor: '#b8e994',
              borderRadius: 20,
              borderColor: 'black',
              borderWidth: 5,
              marginBottom: 10,
            }}>
            <ListItem
              avatar
              onPress={() =>
                this.props.navigation.navigate('ViewComplaintStatus')
              }>
              <Body>
                <Text style={{fontWeight: 'bold'}}>CR0001</Text>
                <Text note>{i18n.t('Complaint Title')}</Text>
              </Body>
              <Right>
                <Text note style={{fontWeight: 'bold'}}>
                {i18n.t('Completed')}
                </Text>
                <Image
                  source={require('./Images/check.png')}
                  style={{
                    width: 50,
                    height: 50,
                    position: 'relative',
                    top: 10,
                  }}
                />
              </Right>
            </ListItem>
          </List>
        </Content>
      </Container>
    );
  }
}

const styles = StyleSheet.create({});
