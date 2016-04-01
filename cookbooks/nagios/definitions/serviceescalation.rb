#
# Author:: Sander Botman <sbotman@schubergphilis.com>
# Cookbook Name : nagios
# Definition    : serviceescalation
#
# Copyright 2015, Sander Botman
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

define :nagios_serviceescalation do
  params[:action] ||= :create
  params[:options] ||= {}

  if nagios_action_create?(params[:action])
    o = Nagios::Serviceescalation.new(params[:name])
    o.import(params[:options])
    Nagios.instance.push(o)
  end

  if nagios_action_delete?(params[:action])
    Nagios.instance.delete('serviceescalation', params[:name])
  end
end
