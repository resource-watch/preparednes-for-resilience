import { connect } from 'react-redux';
import DashboardsPage from '../components/DashboardsPage';

const mapStateToProps = (state, location) => ({
  currentPage: location.route.path
});
const mapDispatchToProps = () => ({});

export default connect(mapStateToProps, mapDispatchToProps)(DashboardsPage);
