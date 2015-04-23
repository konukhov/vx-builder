require 'ostruct'

def create(name, options = {})
  case name

  when :task
    Vx::Builder::Task.new(
      job_id:           1,
      build_id:         12,
      name:             'vexor/vx-test-repo',
      src:              "git@github.com:vexor/vx-test-repo.git",
      sha:              options[:sha] || "8f53c077072674972e21c82a286acc07fada91f5",
      ssh_keys:         [fixture("vx_test_repo_insecure_key"),
                         fixture("test_key1"),
                            fixture("test_key2")],
      build_url:        "https://localhost:3001/builds/1",
      env_vars:         { 'VX_USER_ENV' => 'test me' },
      branch:           options[:branch] || "test/pull-request",
      cache_read_url:   "http://localhost:3001/read",
      cache_write_url:  "http://localhost:3001/write",
      pull_request_id:  options[:pull_request_id],
      job_number:       100,
      build_number:     101,
      project_host:     'github.com'
    )

  when :source
    name = options[:name] || "travis.yml"
    Vx::Builder::BuildConfiguration.from_yaml(fixture(name))

  when :env
    OpenStruct.new(
      init:           [],
      before_install: [],
      install:        [],
      announce:       [],
      before_script:  [],
      script:         [],
      after_script:   [],
      after_script_init: [],
      source:         options[:source] || create(:source),
      after_success:  [],
      task:           options[:task] || create(:task),
      cache_key:      [],
      cached_directories: [],
      before_deploy:       [],
      deploy:              [],
    )

  when :command_from_env
    env = options[:env]
    a = ["set -e"]
    a += env.init
    a.join("\n")

  when :build_configuration_with_matrix_values
    attributes = {
      "env"            => %w{ FOO=1 BAR=2 },
      "rvm"            => %w{ 1.8.7 1.9.3 2.0.0 },
      "scala"          => %w{ 2.9.2 2.10.1 },
      "before_script"  => "echo before_script",
      "before_install" => "echo before_install",
      "script"         => "echo script",
    }.merge(options)
    Vx::Builder::BuildConfiguration.new attributes

  when :matrix_builder
    Vx::Builder::MatrixBuilder.new create(:build_configuration_with_matrix_values, options)
  end

end
