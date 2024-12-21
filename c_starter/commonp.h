typedef struct address_s
{
  char *street;
  char *city;
  char *region;
  char *country;
  char *postal_code;
} ADDRESS_t, *ADDRESS_p_t;

// for multiple functions of similar type
//typedef int COMPARE_PROC_t(const void *, const void *);
//static COMPARE_PROC_t is_greater_equal;
//static COMPARE_PROC_t is_lesser_equal;
void print_an_address(void);