#include "commonp.h"
#include "common.h"
static void print_address(ADDRESS_p_t address_info)
{
  printf("The address is:\n\t%s\n\t%s\n",
      address_info->street,
      address_info->city
      );
}
void print_an_address(void)
{
  ADDRESS_t address;
    address.street="1823 23rd Ave NE";
    address.city ="Seatle";
    address.region="WA";
    address.postal_code = "98023";
  print_address(&address);
}

void print_intro(INTRO_p_t intro){
  printf("The info you entered was \n\t%s %s\n\t%d\n",
      intro->firstName,
      intro->lastName,
      intro->age);
  print_an_address();
}
