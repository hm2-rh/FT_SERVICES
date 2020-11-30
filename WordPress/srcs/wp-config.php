<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress_db' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '*x^[ngp{q /X|3eQXSWB)+([u+sPOw=(dFyjA0SYO.rg5d+!`xw:MeLMjpHk<:aF');
define('SECURE_AUTH_KEY',  '7xU++AU+F()cnKxRy]Qz|ZOa=y-1{dDZ<t9tf=ZA8=PiF[=j2MhI:ojV<c5b]])[');
define('LOGGED_IN_KEY',    '5!P`nNlgTgATl6A=4;QDo@ft<G>HP9LK/[V /rD_L$iDZQzE~r+d?XD(|AzuSt*g');
define('NONCE_KEY',        'NOO+7CY|(-r6$2g[FLUMo)Qn84bIN5wwzEaQ?f,hRbh_BW{TYk{]+<p F7_Y4*VY');
define('AUTH_SALT',        'M $sN1++k;D K!67?))O#N5bCAUUI${6{$th~bY+R36Ft{I|0mK2*C~30~dX{r;L');
define('SECURE_AUTH_SALT', 'JLjWL(W-]b%#,}mFu)+H&TRvXL @o-?j%,Zmvk6$38$aLqcZ?;H>=iY/H*eN~crx');
define('LOGGED_IN_SALT',   'LvFI @=?$S=)bEnrp{;%jHdp_Owuch?3-#v[`n#7nM2-kH2|t%Cdi_Au/dwb8#T}');
define('NONCE_SALT',       '[CuW;)~{9x2[O#?C/o4GtHi/=hxgOFtIUvuABdkFq*mw{=`YOnD=(yPw&_|6+i-M');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
