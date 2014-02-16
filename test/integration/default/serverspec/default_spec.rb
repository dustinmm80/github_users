require "spec_helper"

describe group('github') do
    it { should exist }
    it { should have_gid 2157 }
end

describe user('dustinmm80') do
    it { should exist }
    it { should belong_to_group 'github' }
    it { should have_home_directory '/home/dustinmm80' }
    it { should have_login_shell '/bin/bash' }
    it { should have_authorized_key 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8rjKzMC2dxp+Vl3JUbANG3W1rOYm6qangu4dU1deot2mmzFsoWtv67tmd90scrCua/3Ex60St++rmmOi+Y3eTdYnmzW0/ggi4q27ioW7CSc0emU8/6/UkEk3r77nNnKCsfZeKI6cjiJQuQK7DawkGoQU/HUX5aPfIfoDI6b9jzoMxB9j7JE8g23eBX8Q/g8oPMVMXhMiHmNt0PlHUOtB1Cq1uCWaTtfB5IvxKH+3TT0ODn5b4VrVRe8qx7Z7ugGJ6CqBD6CZyjzFhtUx+WkN1BftlMwz5XkQvLppG86gW5tLUmUVyqM+ekcT4DOQh+ETG/epfGZTgNL4tW2ZNNFOh dustinrcollins@gmail.com' }
end