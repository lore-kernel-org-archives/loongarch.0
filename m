Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DED32F26
	for <loongarch@lists.linux.dev>; Tue, 16 Aug 2022 09:06:15 +0000 (UTC)
Received: from mail-ej1-f43.google.com ([209.85.218.43]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MIyiY-1o3Rzr1bqc-00KPD8 for <loongarch@lists.linux.dev>; Tue, 16 Aug 2022
 11:06:13 +0200
Received: by mail-ej1-f43.google.com with SMTP id dc19so17710456ejb.12
        for <loongarch@lists.linux.dev>; Tue, 16 Aug 2022 02:06:13 -0700 (PDT)
X-Gm-Message-State: ACgBeo0FGtAmobJi4Z4oXj8jXXjq7FXdIL2W95k/Smrw2UCQARXX1G82
	eeksDUWQ72Wff1a3REzhch+KYecQVgnnHsa5XdM=
X-Google-Smtp-Source: AA6agR7/XFetlBcIi1yiDJejGlDn9WbspN+S3R/Ls0zoxtqtIXYbt5mp8yD7AQyB0r181eqAYOXzNBUZ7EBSTS4h/MQ=
X-Received: by 2002:a17:906:8a67:b0:738:7bcd:dca1 with SMTP id
 hy7-20020a1709068a6700b007387bcddca1mr2028088ejc.547.1660640773013; Tue, 16
 Aug 2022 02:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220815124803.3332991-1-chenhuacai@loongson.cn>
 <20220815124803.3332991-2-chenhuacai@loongson.cn> <CAK8P3a2P=XSM1_eD-UkvHaQ8Y4ak4BPAAABg2LxNBhyWhhO4uA@mail.gmail.com>
 <CAAhV-H6ow1WwVdwk4ekQU_aA+dFrUoL3SBrL9Esn9Td-rJKJcg@mail.gmail.com>
In-Reply-To: <CAAhV-H6ow1WwVdwk4ekQU_aA+dFrUoL3SBrL9Esn9Td-rJKJcg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 16 Aug 2022 11:05:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1bmjckVJnnM=h4p8jJ9ZyYZNj2FOusz5N5s3HkWYy2ow@mail.gmail.com>
Message-ID: <CAK8P3a1bmjckVJnnM=h4p8jJ9ZyYZNj2FOusz5N5s3HkWYy2ow@mail.gmail.com>
Subject: Re: [PATCH 2/2] LoongArch: Add ACPI-based generic laptop driver
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@loongson.cn>, 
	"Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Erik Kaneda <erik.kaneda@intel.com>, 
	loongarch@lists.linux.dev, linux-arch <linux-arch@vger.kernel.org>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Jianmin Lv <lvjianmin@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:zdQxPwdB9IMEW1+9HVk42UyhESDWhjVDE0oL8K3dG2GzDR4Ckln
 gN7+Uz4LUNp2O5GtOyC/6cve61IJq7bZikGsw9o913GpKpoiqcZbJqGZQNu9K9QRX4/AD2G
 +mjhh4qrKGp8K5GAp+TzkSjppExm37unsqkyaQ9bmFGaYvjo7xoTaKCNF8wP6VURic//9Yn
 rlhPmi5rgTdqauYlokfbw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bOJHOQ7j6/8=:KTZb9y7ZHE1BX0pHb+Ieqt
 T8HRaPMcTbtoXungTA8+DAIQpBHX0cEPBEW7Vkyc+Q9PsC8su1+5m+u5jPTySVt8dvHrLW4TB
 WYCt7CRJsGnq65VqBU6oFmH8nnjpxcd6K9QfcVSH/6Zt5EQAvUtMv9e7MciKi9XBVVadb0J7W
 G32A3syL7YUN0JJxwIKIcvnGq7Pc5j9/eUPu99W8RdfzJYinLgZnynkqzQ8oAWPUmANpXFA+l
 bcxNvooN+Q3MggB5kSuFg9FMdWkCUhSV5wnQ5VunQszW11KvOPFXj6mBGvhCAfW+7uwAPzQzJ
 Evb/HfwogPrzKlH0ioJsGa7/RZisI9FiT6wA0FxiT3rj9s6YLSZI7+mnKZ7xg6AseE61gu1Pe
 SVvAYtSWEwibkWLTl25/Mx9z1CC9eYEoNrQtYKmr3W8fVNEf0WxS4m5Af1Zzy5F7+tFTMqbhY
 t/IF3qtn05T17i1F0hII/ZLUabDCyctfvejLNdUipHLI59XBGbFLaQrLArD0wbnxhGk4uLhl1
 +lwUF40X3MjbpOVepoqdFFgHAAjYmUArfd/VoVp74gUSlS+RzRwB4NfSTNO5khURCnc7iMgyB
 yCQUAP9qidGJm7kJUXSY7N+kim0Ggtb8WtutqKgfOsDuvKBDjd5nocLdNwYrg1yu6XsNZcqI1
 U+0NN/Zz6rBZn4CW5eoCqAc8gLeBUBFvS0WlCkvo9eSoiCEivP/3X1zjzz5KVB20BdXH8oz/x
 wGExt6q5M6hPr1C8bCk+2zxo+iuCwPvQv0VTQy33+4/eHs7VrmH80xwMFPOAVyqY+qQ69zLlJ
 yuC+Q/OTnGsEx/vem3Nz6dLBbp//UZ5lD4iVWKSbMVeYEUCAiGE6V12B11ozAts3/E0+YA4Bo
 kLu/TowHGHMj37fWaP4w==

On Tue, Aug 16, 2022 at 10:55 AM Huacai Chen <chenhuacai@kernel.org> wrote:
> On Tue, Aug 16, 2022 at 3:11 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Mon, Aug 15, 2022 at 2:48 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
> > > +
> > > +static int __init register_generic_subdriver(struct generic_struct *sub_driver)
> > > +{
> > > +       int rc;
> > > +
> > > +       BUG_ON(!sub_driver->acpi);
> > > +
> > > +       sub_driver->acpi->driver = kzalloc(sizeof(struct acpi_driver), GFP_KERNEL);
> > > +       if (!sub_driver->acpi->driver) {
> > > +               pr_err("failed to allocate memory for ibm->acpi->driver\n");
> > > +               return -ENOMEM;
> > > +       }
> >
> > Drivers should be statically allocated. Usually you want one 'struct
> > acpi_driver' or
> > 'struct platform_driver' per file, so you can just use 'module_acpi_driver()'.
> I found that "subdriver" in other laptop drivers also uses dynamical
> allocation, because there may be various numbers of subdrivers. I want
> to keep it, at least in the next version for review.

Fair enough, I'm not that familiar with drivers/platform/ conventions,
so this is
probably fine.  Adding the drivers/platform/x86 maintainers for clarification,
since your driver probably fits best into that general class regardless of the
CPU instruction set.

> > > +static struct generic_acpi_drv_struct ec_event_acpidriver = {
> > > +       .hid = loongson_htk_device_ids,
> > > +       .notify = event_notify,
> > > +       .handle = &hkey_handle,
> > > +       .type = ACPI_DEVICE_NOTIFY,
> > > +};
> >
> > Same here, this can probably just be an input driver in drivers/input.
>
> It seems the existing "laptop drivers" are also complex drivers to
> bind several "subdrivers" together.

Let's see what Hans and Mark think here as well. My feeling is that this
might be a little different. In the other laptop drivers you'd load a
module for a Dell/HP/Lenovo/Asus/Acer/... model and that has all the
bits that this vendor uses across the system, so a single driver makes
sense.

In embedded systems, you'd have SoC specific drivers that we tend
to put into the respective subsystems (backlight, led, input, ...) and
then users pick the drivers they want.

Loongarch is probably somewhere inbetween, since this is a chip
vendor rather than a laptop vendor, but you have all the same bits
here. The question is more about where we put it.

       Arnd
