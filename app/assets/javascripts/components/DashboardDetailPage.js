import React from 'react';
import Header from './Header';
import Navbar from './Navbar';
import Title from './Title';
import Card from './Card';
import Footer from './Footer';

function DashboardDetailPage(props) {
  return (
    <div className="l-dashboards">
      <Header>
        <Navbar currentPage={props.currentPage} />
        <Title inverse center borderType={1} type="page">
          Dashboard detail page
        </Title>
      </Header>
      <div className="wrapper">
        <Title center>Hello World</Title>
      </div>

      <div className="other-dashboards">
        <div className="wrapper">
          <Title inverse borderType={1}>Other dashboards</Title>
          <div className="other-cards">
            <Card inverse borderType={2}>
              <Title type="content" inverse>
                Framer assesses possible impacts of climate change on his crops
                (grapes)
              </Title>
              <p className="content">
                Farmer X would need to understand how to best prepare for any
                future changes in climate that may impact his grapes. Based on
                key thresholds for climate variables of interest (temperature
                and precipitation), Farmer X evaluate the suitability to grow
                different types of grapes...
              </p>
              <a href="#">
                <img
                  src={gon.assets.lightUniversityWashingtonLogo}
                  width="219"
                  className="logo"
                  alt="University of Washington"
                />
              </a>
            </Card>
            <Card inverse borderType={2}>
              <Title type="content" inverse>
                City Planner assesses possible impacts of Climate Change on
                Puget Sound’s built environment
              </Title>
              <p className="content">
                Most climate change effects are likely to increase the potential
                for damage to infrastructure and service disruptions (unplanned
                transportation closures, delays, or detours) in the Puget Sound
                region, although some risks may decrease.
              </p>
              <a href="#">
                <img
                  src={gon.assets.lightNasaLogo}
                  width="73"
                  className="logo"
                  alt="NASA"
                />
              </a>
            </Card>
          </div>
        </div>
      </div>

      <Footer />
    </div>
  );
}

DashboardDetailPage.propTypes = {
  /**
   * Define the route path (from the router)
   */
  currentPage: React.PropTypes.string,
};

export default DashboardDetailPage;