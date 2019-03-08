/**
 * Define all of your application routes here
 * for more information on routes, see the
 * official documentation https://router.vuejs.org/en/
 */
export default [
  {
    path: '/dashboard',
    // Relative to /src/views
    view: 'Dashboard'
  },
  {
    path: '/images',
    name: 'Images',
    view: 'Images'
  },
  {
    path: '/user-profile',
    name: 'User Profile',
    view: 'UserProfile'
  },
  {
    path: '/notifications',
    view: 'Notifications'
  },
  {
    path: '/swarm',
    name: 'Swarm',
    view: 'Swarm'
  }
]
