DefinitionBlock ("ssdt3.aml", "SSDT", 1, "rasbpi", "Sensehat", 0x00000000)
{
	External(\_SB.GDV0.I2C1, DeviceObj)

	Scope (\_SB.GDV0.I2C1)
	{
		Device(SENS)
		{
			Name(_HID, "PRP0001")
			Name(_DSD, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () {"compatible", Package () { "raspberrypi,sensehat" }}
				}
			})

			Method (_CRS, 0, Serialized)
			{
				Name (SBUF, ResourceTemplate ()
				{
					I2CSerialBusV2(0x46, , 0x000186A0, , "\\_SB.GDV0.I2C1", 0x00, , , ,)
				})
				Return (SBUF)
			}

			Device (SEDP)
			{
				Name(_HID, "PRP0001")
				Name(_DSD, Package () {
					ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
					Package () {
						Package () {"compatible", Package () { "raspberrypi,sensehat-display" }}
					}
				})
			}

			Device (SEJS)
			{
				Name(_HID, "PRP0001")
				Name(_DSD, Package () {
					ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
					Package () {
						Package () {"compatible", Package () { "raspberrypi,sensehat-joystick" }}
					}
				})
			}
		}
	}
}
