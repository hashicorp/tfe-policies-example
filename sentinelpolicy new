import "tfconfig"
import "strings"
import "tfplan"

#Used to collect all security groups from all modules into a map
get_all_security_groups = func() {
  all_security_groups = {}

  for tfconfig.module_paths as path {
    for tfconfig.module(path).resources.aws_security_group else [] as sg_name, sg_config {
      all_security_groups[sg_name] = sg_config
    }
  }

  print("[DEBUG] Printing SG map")
  print(all_security_groups)

  return all_security_groups
}

# Used to collect all security group rules from all modules into a map

get_all_security_group_rules = func() {
  all_security_group_rules = {}

  for tfconfig.module_paths as path {
    for tfconfig.module(path).resources.aws_security_group_rule else [] as sg_rule_name, sg_rule_config {
      all_security_group_rules[sg_rule_name] = sg_rule_config
    }
  }

  print("[DEBUG] Printing SG rule map")
  print(all_security_group_rules)

  return all_security_group_rules
}

# Collect our resources
security_groups = get_all_security_groups()
security_group_rules = get_all_security_group_rules()
security_group_id = module.complete_sg.this_security_group_id
network_location = ["EntFacing", "CustFacing", "Public"]


check_sg_allow_custfacing_to_public = func() {
  {

  for security_group_rules as sg_rule_name, sg_rule_config {


print("[DEBUG] SG rule attachment: ", sg_rule_config.config.security_group_id)
    sg_name = get_name(sg_rule_config.config.security_group_id)


print("[DEBUG] SG tags: ", security_groups[sg_name].config.tags)
    print("[DEBUG] SG NetworkLocation tag: ", security_groups[sg_name].config.tags[0].NetworkLocation)

if security_group_id .config.tags[0].NetworkLocation is "CustFacing" and
sg_rule_config.config.type is "ingress" and
sg_rule_config.config.cidr_blocks contains "0.0.0.0/0"  {

  }
}
   return true

{
main = rule {
    check_sg_custfacing_allow_sg_in_public
    }
}
  }
}
