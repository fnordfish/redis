maintainer       "Scott M. Likens"
maintainer_email "scott@likens.us"
license          "Apache 2.0"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "4.0.01"

description      "Redis: a fast, flexible datastore offering an extremely useful set of data structure primitives"

depends          "runit"
depends		       "sysctl"
recipe           "redis::default",                     "Base configuration for redis"
recipe           "redis::install_from_package",        "Install From Ubuntu Package -- easy but lags in version"
recipe           "redis::install_from_release",        "Install From Release"
recipe           "redis::server",                      "Redis server with runit service"
recipe           "redis::client",                      "Client support for Redis database"

%w[ debian ubuntu ].each do |os|
  supports os
end

attribute "redis/home_dir",
  :display_name          => "",
  :description           => "",
  :default               => "/usr/local/share/redis"

attribute "redis/pid_file",
  :display_name          => "Redis PID file path",
  :description           => "Path to the PID file when daemonized.",
  :default               => "/var/run/redis.pid"

attribute "redis/log_dir",
  :display_name          => "Redis log dir path",
  :description           => "Path to the log directory when daemonized -- will be stored in [log_dir]/redis.log.",
  :default               => "/var/log/redis"

attribute "redis/data_dir",
  :display_name          => "Redis database directory",
  :description           => "Path to the directory for database files.",
  :default               => "/var/lib/redis"

attribute "redis/db_basename",
  :display_name          => "Redis database filename",
  :description           => "Filename for the database storage.",
  :default               => "dump.rdb"

attribute "redis/release_url",
  :display_name          => "URL for redis release package",
  :description           => "If using the install_from_release strategy, the URL for the release tarball",
  :default               => "http://redis.googlecode.com/files/redis-:version:.tar.gz"

attribute "redis/saves",
  :display_name          => "Redis disk persistence policies",
  :description           => "An array of arrays of time, changed objects policies for persisting data to disk.",
  :type                  => "array",
  :default               => [["900", "1"], ["300", "10"], ["60", "10000"]]

attribute "redis/slave",
  :display_name          => "Redis replication slave",
  :description           => "Act as a replication slave to a master redis database.",
  :default               => "no"

attribute "redis/shareobjects",
  :display_name          => "Redis shared object compression (default: \"no\")",
  :description           => "Attempt to reduce memory use by sharing storage for substrings.",
  :default               => "no"

attribute "redis/conf_dir",
  :display_name          => "",
  :description           => "",
  :default               => "/etc/redis"

attribute "redis/conf_template_cookbook",
  :display_name          => "overwrite cookbook to the redis.config.erb template",
  :description           => ""

attribute "redis/user",
  :display_name          => "",
  :description           => "",
  :default               => "redis"

attribute "redis/version",
  :display_name          => "",
  :description           => "",
  :default               => "2.0.2"

attribute "redis/server/addr",
  :display_name          => "IP address to bind.",
  :description           => "IP address to bind.",
  :default               => "0.0.0.0"

attribute "redis/server/port",
  :display_name          => "Redis server port",
  :description           => "TCP port to bind.",
  :default               => "6379"

attribute "redis/server/timeout",
  :display_name          => "Redis server timeout",
  :description           => "Timeout, in seconds, for disconnection of idle clients.",
  :default               => "300"

attribute "redis/server/loglevel",
  :display_name          => "Set server verbosity to 'debug'",
  :description           => "it can be one of: debug, verbose, notice, warning",
  :default               => "notice"

attribute "redis/server/databases",
  :display_name          => "Set the number of databases.",
  :description           => "",
  :default               => "16"

attribute "redis/server/maxclients",
  :display_name          => "Set the max number of connected clients at the same time.",
  :description           => "Once the limit is reached Redis will close all the new connections sending an error 'max number of clients reached'.",
  :default               => "10000"

attribute "redis/server/maxmemory",
  :display_name          => "Don't use more memory than the specified amount of bytes.",
  :description           => ""

attribute "redis/server/slowlog_log_slower_than",
  :display_name          => "The Redis Slow Log is a system to log queries that exceeded a specified execution time",
  :description           => "Time in microseconds"

attribute "redis/server/slowlog_max_len",
  :display_name          => "The Redis Slow Log is a system to log queries as long as the slow log is smaller that this value",
  :description           => ""

attribute "users/redis/uid",
  :display_name          => "",
  :description           => "",
  :default               => "335"

attribute "groups/redis/gid",
  :display_name          => "",
  :description           => "",
  :default               => "335"
