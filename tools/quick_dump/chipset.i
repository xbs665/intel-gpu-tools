%module chipset
%include "stdint.i"
%{
#include <pciaccess.h>
#include <stdint.h>
#include "intel_chipset.h"
extern int is_sandybridge(unsigned short pciid);
extern int is_ivybridge(unsigned short pciid);
extern int is_valleyview(unsigned short pciid);
extern struct pci_device *intel_get_pci_device();
extern int intel_register_access_init(struct pci_device *pci_dev, int safe);
extern uint32_t intel_register_read(uint32_t reg);
extern void intel_register_access_fini();
extern unsigned short pcidev_to_devid(struct pci_device *pci_dev);
%}

extern int is_sandybridge(unsigned short pciid);
extern int is_ivybridge(unsigned short pciid);
extern int is_valleyview(unsigned short pciid);
extern struct pci_device *intel_get_pci_device();
extern int intel_register_access_init(struct pci_device *pci_dev, int safe);
extern uint32_t intel_register_read(uint32_t reg);
extern void intel_register_access_fini();
extern unsigned short pcidev_to_devid(struct pci_device *pci_dev);
