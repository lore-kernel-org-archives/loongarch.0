Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69671103
	for <loongarch@lists.linux.dev>; Mon, 15 Aug 2022 19:11:32 +0000 (UTC)
Received: from mail-ej1-f51.google.com ([209.85.218.51]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M5Q6l-1oP34S0u0b-001TxW for <loongarch@lists.linux.dev>; Mon, 15 Aug 2022
 21:11:25 +0200
Received: by mail-ej1-f51.google.com with SMTP id i14so15075341ejg.6
        for <loongarch@lists.linux.dev>; Mon, 15 Aug 2022 12:11:25 -0700 (PDT)
X-Gm-Message-State: ACgBeo16v1o7HMxADcRG4OUOOdKS5W8NqrS2F1NI4mPZWV+YTZVdCX7D
	H4+EB0/Lku44NCFK6bsp+NSAy1V4FBBz+K+nwPo=
X-Google-Smtp-Source: AA6agR4JuiQKPqjpyvBzGbvr5VKRMH2RGu991D7gP5wwEtHkuPtwIFkYm248LOmAveMDVMtCW9KS23hCkpF4P8janIg=
X-Received: by 2002:a17:907:7609:b0:730:d70a:1efc with SMTP id
 jx9-20020a170907760900b00730d70a1efcmr11292737ejc.766.1660590684735; Mon, 15
 Aug 2022 12:11:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220815124803.3332991-1-chenhuacai@loongson.cn> <20220815124803.3332991-2-chenhuacai@loongson.cn>
In-Reply-To: <20220815124803.3332991-2-chenhuacai@loongson.cn>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 15 Aug 2022 21:11:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2P=XSM1_eD-UkvHaQ8Y4ak4BPAAABg2LxNBhyWhhO4uA@mail.gmail.com>
Message-ID: <CAK8P3a2P=XSM1_eD-UkvHaQ8Y4ak4BPAAABg2LxNBhyWhhO4uA@mail.gmail.com>
Subject: Re: [PATCH 2/2] LoongArch: Add ACPI-based generic laptop driver
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, 
	"Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Erik Kaneda <erik.kaneda@intel.com>, 
	loongarch@lists.linux.dev, linux-arch@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Jianmin Lv <lvjianmin@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mid5pFEGls0m/+zbH5F45cnLZR4yEpljVUc/zA5ikM4HkG8/LSS
 l8qFzZnuWvYnmf/SoUGjYmMrmuvQRQ8dsyDGty7MQNHfW0df812DTSzGBaiPLRYsscv+vgO
 +iz8BgR2vWbIBCDim4xsmExA4BlZDFEl6ljU1Tytk6R2+MEDm4JLPW6RpQDwgjYGQp7eAUW
 Xlny/fU0Ej12fhJDWbSJA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kig+Z++GMlY=:04tQajSBIc/W8JSJGGLVHZ
 psrE4mu+W7s0Afz4h+x/ezroxM6qCXwKWYKIXBVc4QekAfjOx3K0WnxXyQvEgRyMbYQh6N6mu
 TQTM7TV2bARIncRuq8EG5ONYTeTfCB4z/9Tebu+KdT47UB+LK/lE38SJDJ73BtqSTQfRiIevq
 Wxnaxa/KyMPHpPH9l2DWZoRpsRUGBREsKoAEfxjNtCqz8wlkD0i/sHzObKpUuDFuuDICUn2Wn
 OBFDL8HBqnEqxRsXfu2R6vs4bOZy6A1axnbdvkqMcU/3n5exuPuYtVGJE025hif7fMWwgIGQC
 dqv1jwas/nyAOYJs5EUOBxxWK6SiklfOEdDxRQtwYmENJimpfc4sm1fYgmHtNW6IEqFX+Dl//
 +3STW6oDoXf25YbXU47NG7YmmI3JE4q67ST68eTYHIuI1slOFgM6nPATLcCFhUSgT+auilk1X
 zlIJLReN5c41hVNaKQykPCk8Bv54UYRrtmO9zKPyU8Inz+HunOTXwQCCbBMTbbz5UsKoj1yuY
 ojPoIBAKaTmhCLjDg0BsofHr+dVEy0a7maSx/cFO8s7mOyW+arbTKa7o9fkmjNIQmori3UUkN
 kgfBoKb16OHnbtasSbA1OvIDtvK60eUeF/OB4yJdI4fYz2Pg9yozhsRZa5AFR+JkUv1DlCeE2
 D5xW0EcyoIAuVlM7o1RUU3tDb/1NAmOdtHcDdSmqr0L+reQ/vFo/Qpykx3GcKJWFNr+mepg0V
 Z0UbD+uyJtxhf4byL+E7g+tC3kBlrrT/4yMPmakdFEuML+lZHdhThFLPx+WnjYujK1pz/SdWj
 gOya6Dym262k24Y6YAEPXdxXB9Yc+peg+QO0Pt9fftIM7eNhcfwsjVNEd+78bfnTIP7JP+zWi
 4NC1zt2WfPciJwakLKgw==

On Mon, Aug 15, 2022 at 2:48 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
>
> From: Jianmin Lv <lvjianmin@loongson.cn>
>
> This add ACPI-based generic laptop driver for Loongson-3. Some of the
> codes are derived from drivers/platform/x86/thinkpad_acpi.c.
>
> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  drivers/platform/loongarch/Kconfig          |  18 +
>  drivers/platform/loongarch/Makefile         |   1 +
>  drivers/platform/loongarch/generic-laptop.c | 775 ++++++++++++++++++++
>  3 files changed, 794 insertions(+)
>  create mode 100644 drivers/platform/loongarch/generic-laptop.c
>
> diff --git a/drivers/platform/loongarch/Kconfig b/drivers/platform/loonga=
rch/Kconfig
> index a1542843b0ad..086212d57251 100644
> --- a/drivers/platform/loongarch/Kconfig
> +++ b/drivers/platform/loongarch/Kconfig
> @@ -23,4 +23,22 @@ config CPU_HWMON
>         help
>           Loongson-3A/3B/3C CPU HWMon (temperature sensor) driver.
>
> +config GENERIC_LAPTOP
> +       tristate "Generic Loongson-3A Laptop Driver"
> +       depends on MACH_LOONGSON64
> +       depends on ACPI
> +       depends on INPUT
> +       select BACKLIGHT_CLASS_DEVICE
> +       select BACKLIGHT_LCD_SUPPORT
> +       select HWMON
> +       select INPUT_EVDEV
> +       select INPUT_SPARSEKMAP
> +       select LCD_CLASS_DEVICE
> +       select LEDS_CLASS
> +       select POWER_SUPPLY
> +       select VIDEO_OUTPUT_CONTROL
> +       default y
> +       help
> +         ACPI-based Loongson-3 family laptops generic driver.

It's rather bad style to 'select' entire subsystems from a device
driver. This may be
unavoidable in some cases, but please try to make it possible to build the
driver when some or all of the other subsystems are disabled. In a lot
of subsystems,
there is an API stub like

> +/***********************************************************************=
*****
> + ***********************************************************************=
*****
> + *
> + * ACPI Helpers and device model
> + *
> + ***********************************************************************=
*****
> + ***********************************************************************=
*****/

Try to follow the normal commenting style

> +/* ACPI basic handles */
> +
> +static int acpi_evalf(acpi_handle handle,
> +                     int *res, char *method, char *fmt, ...);
> +static acpi_handle ec_handle;

Instead of forward function declarations, try sorting the functions in
call order,
which has the benefit of making more sense to most readers.

> +#ifdef CONFIG_PM
> +static int loongson_generic_suspend(struct device *dev)
> +{
> +       return 0;
> +}
> +static int loongson_generic_resume(struct device *dev)
> +{
> +       int status =3D 0;
> +       struct key_entry ke;
> +       struct backlight_device *bd;
> +
> +       /*
> +        * Only if the firmware supports SW_LID event model, we can handl=
e the
> +        * event. This is for the consideration of development board with=
out
> +        * EC.
> +        */
> +       if (test_bit(SW_LID, generic_inputdev->swbit)) {
> +               if (hotkey_status_get(&status))
> +                       return -EIO;
> +               /*
> +                * The input device sw element records the last lid statu=
s.
> +                * When the system is awakened by other wake-up sources,
> +                * the lid event will also be reported. The judgment of
> +                * adding SW_LID bit which in sw element can avoid this
> +                * case.
> +                *
> +                * input system will drop lid event when current lid even=
t
> +                * value and last lid status in the same data set=EF=BC=
=8Cwhich
> +                * data set inclue zero set and no zero set. so laptop
> +                * driver doesn't report repeated events.
> +                *
> +                * Lid status is generally 0, but hardware exception is
> +                * considered. So add lid status confirmation.
> +                */
> +               if (test_bit(SW_LID, generic_inputdev->sw) && !(status & =
(1 << SW_LID))) {
> +                       ke.type =3D KE_SW;
> +                       ke.sw.value =3D (u8)status;
> +                       ke.sw.code =3D SW_LID;
> +                       sparse_keymap_report_entry(generic_inputdev, &ke,
> +                                       1, true);
> +               }
> +       }
> +
> +       bd =3D backlight_device_get_by_type(BACKLIGHT_PLATFORM);
> +       if (bd) {
> +               loongson_laptop_backlight_update(bd) ?
> +               pr_warn("Loongson_backlight:resume brightness failed") :
> +               pr_info("Loongson_backlight:resume brightness %d\n", bd->=
props.brightness);
> +       }
> +
> +       return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(loongson_generic_pm,
> +               loongson_generic_suspend, loongson_generic_resume);
> +#endif


Instead of the #ifdef, use the newer DEFINE_SIMPLE_DEV_PM_OPS() in place
of SIMPLE_DEV_PM_OPS() so the code will always be parsed but left out
when CONFIG_PM is disabled.

> +
> +static int __init register_generic_subdriver(struct generic_struct *sub_=
driver)
> +{
> +       int rc;
> +
> +       BUG_ON(!sub_driver->acpi);
> +
> +       sub_driver->acpi->driver =3D kzalloc(sizeof(struct acpi_driver), =
GFP_KERNEL);
> +       if (!sub_driver->acpi->driver) {
> +               pr_err("failed to allocate memory for ibm->acpi->driver\n=
");
> +               return -ENOMEM;
> +       }

Drivers should be statically allocated. Usually you want one 'struct
acpi_driver' or
'struct platform_driver' per file, so you can just use 'module_acpi_driver(=
)'.

> +int ec_get_brightness(void)
> +{
> +       int status =3D 0;
> +
> +       if (!hkey_handle)
> +               return -ENXIO;
> +
> +       if (!acpi_evalf(hkey_handle, &status, "ECBG", "d"))
> +               return -EIO;
> +
> +       if (status < 0)
> +               return status;
> +
> +       return status;
> +}
> +EXPORT_SYMBOL(ec_get_brightness);

The name is too generic to have it in the global namespace for a platform
specific driver. Use a prefix to make it clear which driver this belongs to=
.

Not sure this function warrants an export though, it looks like you could
just have it in the caller module.

> +
> +int turn_off_backlight(void)
> +{
> +       int status;
> +       union acpi_object arg0 =3D { ACPI_TYPE_INTEGER };
> +       struct acpi_object_list args =3D { 1, &arg0 };
> +
> +       arg0.integer.value =3D 0;
> +       status =3D acpi_evaluate_object(NULL, "\\BLSW", &args, NULL);
> +       if (ACPI_FAILURE(status)) {
> +               pr_info("Loongson lvds error: 0x%x\n", status);
> +               return -ENODEV;
> +       }
> +
> +       return 0;
> +}

Again, the name is too generic for a global function.

I suspect that if you split out the backlight handling into a separate
driver, you can avoid
the 'select' statements completely and make that driver 'depends on
BACKLIGHT_CLASS_DEVICE'
or move it within the 'if BACKLIGHT_CLASS_DEVICE' section of
drivers/video/backlight/Kconfig.


> +static struct generic_acpi_drv_struct ec_event_acpidriver =3D {
> +       .hid =3D loongson_htk_device_ids,
> +       .notify =3D event_notify,
> +       .handle =3D &hkey_handle,
> +       .type =3D ACPI_DEVICE_NOTIFY,
> +};

Same here, this can probably just be an input driver in drivers/input.

       Arnd
