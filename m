Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E0E277C8B
	for <loongarch@lists.linux.dev>; Wed, 23 Jul 2025 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753260283; cv=none; b=OjlZeliSQ7loMcizoc4/ZuQt4zbj4QzJsg7wCCsYJXylPyKubeIygUOyaF47R6vNbRtCcbMP6CxR+cSH8Sip62anV9tepDri4QQEPMOyfIStSCy+S9sgW6j6VKi2tVNVnV4pb3gVtFQ31+B1FWjZHM5k8ODPq6jLkgd8lwcGdYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753260283; c=relaxed/simple;
	bh=pWvEMS6fqjqBI7s4q8+W3E3k2HumT+dDpCTc43kFNdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XTjZBsYzCLNyN0g7cZsb3Hjuh4kyCuXtMIM0amtXMaiFbGStgeHaTrKTm0uVH7lHYscwXC3SqQXhVVoRIstAAOCIfu6+Rnpe3usoSBVk6wOulzTHC0cVdIg04tdfoBxE0ZNuoQHRk4Rg3+9QFhamCxRUuNUD0rZBHbffVsrkWRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nooqa1t6; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nooqa1t6"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae0ccfd5ca5so921269166b.3
        for <loongarch@lists.linux.dev>; Wed, 23 Jul 2025 01:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753260278; x=1753865078; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmT3Xd0fCgFsmeU54UaZ/j1/K9rqcuzzBJu38L/GcB0=;
        b=nooqa1t6aQ3BXrMcNYHxxok/MxDG1jv6tLgzHj6dVMhKo5LjsEFv89mJWIqw//4lfs
         KQV+ONO3g8NnWYqNvRH2Sn2XBCsIHIM4odqQkZ4u3vVxtl9eoofvP9HS6i3fC+1Yr57G
         574ApCjhlemyZVQfa/cR50k6XnTkISg3TKXg5jZNSmOr4U0ckwP3l3cDVWl844gDL6dS
         pxoEc+euJe/yneByoZblu3SFzPRTG9f+DyxhOz9osLRXxNdeqN7CcFGM6Oqx8osgo2xT
         sbmLdbvap7MnSrU/RVbzLuOLAnjWqEkHFCh3mojJqNlBBrybQiFL/Mf1Yi30UexbxsHA
         UBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753260278; x=1753865078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmT3Xd0fCgFsmeU54UaZ/j1/K9rqcuzzBJu38L/GcB0=;
        b=LwU9hoekfJZTrOYQyuGazgyz9GpMCTsCVKQMR3Cwh5j3aFZ9joLHm9zvpVhe4NM+TP
         MBfvjzitBt9Wn/jlhRMisTiroVGpyeNaG3RzguBo6p/DRVWETtE4iOMIzmzdvIEGo18Q
         cVA5xE689p/XqDmxpA70nj+fG/b7RPGv/gj7/db6WHa6SnwUiZ4Zsl7hKXYEd4TCOL/M
         94za98x8ZIZuXQk5cdilm/HNL4PnGz19H7Z3v/XlRVTBSOofhqdgwJofW7L5gLgTzNrf
         AEzBRSBuiJEjIRSQ0xUXYe/YgQGy9b4fHzMxy4jw4NH1MNBdO8CwMGG8+O4CR1CJgBHh
         hx3w==
X-Forwarded-Encrypted: i=1; AJvYcCUeFFDoPBRVpByuAPcPZXejZJbij6IE6Jt+PB+Xx8rs0vCckGOOHMNqNu+VF6D9O3gHY9BrAcl1nsc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCenjF9TiEK5hTioE6Nxgaa9l98YCP2tEO0yxDL/CmpTG6w9vT
	u5HoinaYSF5y5UHIs6c8GtdsFc9KBFIbkbXEkKc9XerjuZsP9w3HZKtqoBjHuLeXgfVcCl1ScT0
	bb5yk7AiCYY+Uv6g3mn8SMOoK6rQt9fQ=
X-Gm-Gg: ASbGncvXncDGe13oNVchtlrWN9AXS9KDKZowDA2bMf+I5sMr5e8OwQMHXIdLaEGsN4s
	8Ju2QEBUbj4vg75qPwvmo5hO3R2v4Vs0El7aNvW6qjHllu7lwYYthkf8mOBW9kebpWwLIYWhwe6
	wQG4k0e9LXZgzW/o+3n8K1DDNjh0PEidbi0re2uO1nLE1WTmOxSaZPkQaQaUhNa1HCluyhpf5mF
	1INmKsn
X-Google-Smtp-Source: AGHT+IFLoopykPAqNjtd5W6TlSWzjDWsawJ2toIWTAtblBp5S97TdAnSiXv4oGkhVDw4RAbSB9WhWLXl+SLYi5ShPb0=
X-Received: by 2002:a17:907:9415:b0:ae6:f8bc:3f82 with SMTP id
 a640c23a62f3a-af2f9271ac6mr200013166b.52.1753260277945; Wed, 23 Jul 2025
 01:44:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1751617911.git.zhoubinbin@loongson.cn> <f4c546b0160294296c98b6b12b0ab1d2000dd44c.1751617911.git.zhoubinbin@loongson.cn>
 <20250710100323.GI1431498@google.com> <CAMpQs4LQME7oO8i2FWgUsAQqwThcp=R3jubPGqZ1Vr-pvEHvoA@mail.gmail.com>
 <20250718135246.GH11056@google.com> <CAMpQs4+AOc2bkOFSWW_hX-+akyRT9vTBb6mFJGKpjt9fSsF7MQ@mail.gmail.com>
 <20250723073125.GL11056@google.com> <CAMpQs4Ld75Ej7wn82iwMu4VeyoTUBeD7UttYoiKXwTqCK6yTzQ@mail.gmail.com>
 <20250723082111.GO11056@google.com>
In-Reply-To: <20250723082111.GO11056@google.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 23 Jul 2025 16:44:23 +0800
X-Gm-Features: Ac12FXzKZe24rmw-T7HjbIkZgLdtAblZt7fSQoAbY_MNcvk4GacSAWm8ndgOBEk
Message-ID: <CAMpQs4JMSZ-079Am2YnukgajU75j=GPt=qoh=f0=vRwqw8mVZw@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function support
To: Lee Jones <lee@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Corey Minyard <minyard@acm.org>, Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io, 
	kexybiscuit@aosc.io, wangyao@lemote.com, Chong Qiao <qiaochong@loongson.cn>, 
	Corey Minyard <corey@minyard.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee:

On Wed, Jul 23, 2025 at 4:21=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Wed, 23 Jul 2025, Binbin Zhou wrote:
>
> > Hi Lee:
> >
> > Thanks for your reply again.
> >
> > On Wed, Jul 23, 2025 at 3:31=E2=80=AFPM Lee Jones <lee@kernel.org> wrot=
e:
> > >
> > > On Mon, 21 Jul 2025, Binbin Zhou wrote:
> > >
> > > > Hi Lee:
> > > >
> > > > Thanks for your reply.
> > > >
> > > >
> > > > On Fri, Jul 18, 2025 at 9:52=E2=80=AFPM Lee Jones <lee@kernel.org> =
wrote:
> > > > >
> > > > > On Fri, 11 Jul 2025, Binbin Zhou wrote:
> > > > >
> > > > > > Hi Lee:
> > > > > >
> > > > > > Thanks for your review.
> > > > > >
> > > > > > On Thu, Jul 10, 2025 at 6:03=E2=80=AFPM Lee Jones <lee@kernel.o=
rg> wrote:
> > > > > > >
> > > > > > > On Fri, 04 Jul 2025, Binbin Zhou wrote:
> > > > > > >
> > > > > > > > Since the display is a sub-function of the Loongson-2K BMC,=
 when the
> > > > > > > > BMC reset, the entire BMC PCIe is disconnected, including t=
he display
> > > > > > > > which is interrupted.
> > > > > > > >
> > > > > > > > Quick overview of the entire LS2K BMC reset process:
> > > > > > > >
> > > > > > > > There are two types of reset methods: soft reset (BMC-initi=
ated reboot
> > > > > > > > of IPMI reset command) and BMC watchdog reset (watchdog tim=
eout).
> > > > > > > >
> > > > > > > > First, regardless of the method, an interrupt is generated =
(PCIe interrupt
> > > > > > > > for soft reset/GPIO interrupt for watchdog reset);
> > > > > > > >
> > > > > > > > Second, during the interrupt process, the system enters bmc=
_reset_work,
> > > > > > > > clears the bus/IO/mem resources of the LS7A PCI-E bridge, w=
aits for the BMC
> > > > > > > > reset to begin, then restores the parent device's PCI confi=
guration space,
> > > > > > > > waits for the BMC reset to complete, and finally restores t=
he BMC PCI
> > > > > > > > configuration space.
> > > > > > > >
> > > > > > > > Display restoration occurs last.
> > > > > > > >
> > > > > > > > Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
> > > > > > > > Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> > > > > > > > Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > > > > > Acked-by: Corey Minyard <corey@minyard.net>
> > > > > > > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > > > > > > ---
> > > > > > > >  drivers/mfd/ls2k-bmc-core.c | 328 ++++++++++++++++++++++++=
++++++++++++
> > > > > > > >  1 file changed, 328 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k=
-bmc-core.c
> > > > > > > > index 50d560a4611c..1ae673f6a196 100644
> > > > > > > > --- a/drivers/mfd/ls2k-bmc-core.c
> > > > > > > > +++ b/drivers/mfd/ls2k-bmc-core.c
> > > > > > > > @@ -10,8 +10,12 @@
> > > > > > > >   */
> > > > > > > >
> > > > > > > >  #include <linux/aperture.h>
> > > > > > > > +#include <linux/bitfield.h>
> > > > > > > > +#include <linux/delay.h>
> > > > > > > >  #include <linux/errno.h>
> > > > > > > >  #include <linux/init.h>
> > > > > > > > +#include <linux/iopoll.h>
> > > > > > > > +#include <linux/kbd_kern.h>
> > > > > > > >  #include <linux/kernel.h>
> > > > > > > >  #include <linux/mfd/core.h>
> > > > > > > >  #include <linux/module.h>
> > > > > > > > @@ -19,6 +23,8 @@
> > > > > > > >  #include <linux/pci_ids.h>
> > > > > > > >  #include <linux/platform_data/simplefb.h>
> > > > > > > >  #include <linux/platform_device.h>
> > > > > > > > +#include <linux/stop_machine.h>
> > > > > > > > +#include <linux/vt_kern.h>
> > > > > > > >
> > > > > > > >  /* LS2K BMC resources */
> > > > > > > >  #define LS2K_DISPLAY_RES_START               (SZ_16M + SZ_=
2M)
> > > > > > > > @@ -29,6 +35,48 @@
> > > > > > > >  #define LS2K_IPMI3_RES_START         (LS2K_IPMI2_RES_START=
 + LS2K_IPMI_RES_SIZE)
> > > > > > > >  #define LS2K_IPMI4_RES_START         (LS2K_IPMI3_RES_START=
 + LS2K_IPMI_RES_SIZE)
> > > > > > > >
> > > > > > > > +#define LS7A_PCI_CFG_SIZE            0x100
> > > > > > > > +
> > > > > > > > +/* LS7A bridge registers */
> > > > > > > > +#define LS7A_PCIE_PORT_CTL0          0x0
> > > > > > > > +#define LS7A_PCIE_PORT_STS1          0xC
> > > > > > > > +#define LS7A_GEN2_CTL                        0x80C
> > > > > > > > +#define LS7A_SYMBOL_TIMER            0x71C
> > > > > > > > +
> > > > > > > > +/* Bits of LS7A_PCIE_PORT_CTL0 */
> > > > > > > > +#define LS2K_BMC_PCIE_LTSSM_ENABLE   BIT(3)
> > > > > > > > +
> > > > > > > > +/* Bits of LS7A_PCIE_PORT_STS1 */
> > > > > > > > +#define LS2K_BMC_PCIE_LTSSM_STS              GENMASK(5, 0)
> > > > > > > > +#define LS2K_BMC_PCIE_CONNECTED              0x11
> > > > > > > > +
> > > > > > > > +#define LS2K_BMC_PCIE_DELAY_US               1000
> > > > > > > > +#define LS2K_BMC_PCIE_TIMEOUT_US     1000000
> > > > > > > > +
> > > > > > > > +/* Bits of LS7A_GEN2_CTL */
> > > > > > > > +#define LS7A_GEN2_SPEED_CHANG                BIT(17)
> > > > > > > > +#define LS7A_CONF_PHY_TX             BIT(18)
> > > > > > > > +
> > > > > > > > +/* Bits of LS7A_SYMBOL_TIMER */
> > > > > > > > +#define LS7A_MASK_LEN_MATCH          BIT(26)
> > > > > > > > +
> > > > > > > > +/* Interval between interruptions */
> > > > > > > > +#define LS2K_BMC_INT_INTERVAL                (60 * HZ)
> > > > > > > > +
> > > > > > > > +/* Maximum time to wait for U-Boot and DDR to be ready wit=
h ms. */
> > > > > > > > +#define LS2K_BMC_RESET_WAIT_TIME     10000
> > > > > > > > +
> > > > > > > > +/* It's an experience value */
> > > > > > > > +#define LS7A_BAR0_CHECK_MAX_TIMES    2000
> > > > > > > > +
> > > > > > > > +#define LS2K_BMC_RESET_GPIO          14
> > > > > > > > +#define LOONGSON_GPIO_REG_BASE               0x1FE00500
> > > > > > > > +#define LOONGSON_GPIO_REG_SIZE               0x18
> > > > > > > > +#define LOONGSON_GPIO_OEN            0x0
> > > > > > > > +#define LOONGSON_GPIO_FUNC           0x4
> > > > > > > > +#define LOONGSON_GPIO_INTPOL         0x10
> > > > > > > > +#define LOONGSON_GPIO_INTEN          0x14
> > > > > > > > +
> > > > > > > >  static struct resource ls2k_display_resources[] =3D {
> > > > > > > >       DEFINE_RES_MEM_NAMED(LS2K_DISPLAY_RES_START, SZ_4M, "=
simpledrm-res"),
> > > > > > > >  };
> > > > > > > > @@ -62,6 +110,273 @@ static struct mfd_cell ls2k_bmc_cells[=
] =3D {
> > > > > > > >       MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi4_resources),
> > > > > > > >  };
> > > > > > > >
> > > > > > > > +/* Index of the BMC PCI configuration space to be restored=
 at BMC reset. */
> > > > > > > > +struct ls2k_bmc_pci_data {
> > > > > > > > +     u32 pci_command;
> > > > > > > > +     u32 base_address0;
> > > > > > > > +     u32 interrupt_line;
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +/* Index of the parent PCI configuration space to be resto=
red at BMC reset. */
> > > > > > > > +struct ls2k_bmc_bridge_pci_data {
> > > > > > > > +     u32 pci_command;
> > > > > > > > +     u32 base_address[6];
> > > > > > > > +     u32 rom_addreess;
> > > > > > > > +     u32 interrupt_line;
> > > > > > > > +     u32 msi_hi;
> > > > > > > > +     u32 msi_lo;
> > > > > > > > +     u32 devctl;
> > > > > > > > +     u32 linkcap;
> > > > > > > > +     u32 linkctl_sts;
> > > > > > > > +     u32 symbol_timer;
> > > > > > > > +     u32 gen2_ctrl;
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +struct ls2k_bmc_pdata {
> > > > > > > > +     struct device *dev;
> > > > > > > > +     struct work_struct bmc_reset_work;
> > > > > > > > +     struct ls2k_bmc_pci_data bmc_pci_data;
> > > > > > > > +     struct ls2k_bmc_bridge_pci_data bridge_pci_data;
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +static bool ls2k_bmc_bar0_addr_is_set(struct pci_dev *ppde=
v)
> > > > > > >
> > > > > > > Nit: This is usually called pdev.
> > > > > >
> > > > > > OK.
> > > > >
> > > > > Snip things you agree with please.
> > > > >
> > > > > [...]
> > > > >
> > > > > > > > +static void ls2k_bmc_events_fn(struct work_struct *work)
> > > > > > > > +{
> > > > > > > > +     struct ls2k_bmc_pdata *priv =3D container_of(work, st=
ruct ls2k_bmc_pdata, bmc_reset_work);
> > > > > > > > +
> > > > > > > > +     /*
> > > > > > > > +      * The PCI-E is lost when the BMC resets, at which po=
int access to the PCI-E
> > > > > > > > +      * from other CPUs is suspended to prevent a crash.
> > > > > > > > +      */
> > > > > > > > +     stop_machine(ls2k_bmc_recover_pci_data, priv, NULL);
> > > > > > > > +
> > > > > > > > +#ifdef CONFIG_VT
> > > > > > >
> > > > > > > #ifery in C-files is generally frowned upon.
> > > > > > >
> > > > > > > Is the any pieces of run-time data you can use instead?
> > > > > > >
> > > > > > > Or a stub which culminated in a no-op if !CONFIG_VT?
> > > > > >
> > > > > > Emm, I'm not sure if I understand correctly, but is the followi=
ng way suitable?
> > > > > >
> > > > > >         if (IS_ENABLED(CONFIG_VT))
> > > > >
> > > > > It's better than #if, but even better would be a stub in a header=
 file.
> > > >
> > > > Hmm... The declarations for vt_move_to_console()/set_console() are =
in
> > > > two VT-related header files [1]. Adding the relevant stub functions
> > > > involves the VT subsystem, which does not seem to be relevant to th=
e
> > > > subject of our patch set.
> > > > Therefore, I think the above modification is more suitable for us.
> > >
> > > All of the subsystems in the kernel are open source, last time I chec=
ked. :)
> > >
> > > But okay, I won't insist on it.
> > >
> > > > [1]:
> > > > vt_move_to_console:
> > > > https://elixir.bootlin.com/linux/v6.15/source/include/linux/vt_kern=
.h#L141
> > > > set_console: https://elixir.bootlin.com/linux/v6.15/source/include/=
linux/kbd_kern.h#L69
> > > >
> > > > >
> > > > > >                 /* Re-push the display due to previous PCI-E lo=
ss. */
> > > > > >                 set_console(vt_move_to_console(MAX_NR_CONSOLES =
- 1, 1));
> > > > > >
> > > > > > >
> > > > > > > > +     /* Re-push the display due to previous PCI-E loss. */
> > > > > > > > +     set_console(vt_move_to_console(MAX_NR_CONSOLES - 1, 1=
));
> > > > > > > > +#endif
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static irqreturn_t ls2k_bmc_interrupt(int irq, void *arg)
> > > > > > > > +{
> > > > > > > > +     struct ls2k_bmc_pdata *priv =3D arg;
> > > > > > > > +     static unsigned long last_jiffies;
> > > > > > > > +
> > > > > > > > +     if (system_state !=3D SYSTEM_RUNNING)
> > > > > > > > +             return IRQ_HANDLED;
> > > > > > > > +
> > > > > > > > +     /* Skip interrupt in LS2K_BMC_INT_INTERVAL */
> > > > > > > > +     if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_I=
NTERVAL)) {
> > > > > > > > +             schedule_work(&priv->bmc_reset_work);
> > > > > > > > +             last_jiffies =3D jiffies;
> > > > > > > > +     }
> > > > > > > > +
> > > > > > > > +     return IRQ_HANDLED;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +/*
> > > > > > > > + * Saves the BMC parent device (LS7A) and its own PCI conf=
iguration space registers
> > > > > > > > + * that need to be restored after BMC reset.
> > > > > > > > + */
> > > > > > > > +static void ls2k_bmc_save_pci_data(struct pci_dev *pdev, s=
truct ls2k_bmc_pdata *priv)
> > > > > > > > +{
> > > > > > > > +     struct pci_dev *parent =3D pdev->bus->self;
> > > > > > > > +     int base, i =3D 0;
> > > > > > > > +
> > > > > > > > +     pci_read_config_dword(parent, PCI_COMMAND, &priv->bri=
dge_pci_data.pci_command);
> > > > > > > > +
> > > > > > > > +     for (base =3D PCI_BASE_ADDRESS_0; base <=3D PCI_BASE_=
ADDRESS_5; base +=3D 4, i++)
> > > > > > > > +             pci_read_config_dword(parent, base, &priv->br=
idge_pci_data.base_address[i]);
> > > > > > > > +
> > > > > > > > +     pci_read_config_dword(parent, PCI_ROM_ADDRESS, &priv-=
>bridge_pci_data.rom_addreess);
> > > > > > > > +     pci_read_config_dword(parent, PCI_INTERRUPT_LINE, &pr=
iv->bridge_pci_data.interrupt_line);
> > > > > > > > +
> > > > > > > > +     pci_read_config_dword(parent, parent->msi_cap + PCI_M=
SI_ADDRESS_LO,
> > > > > > > > +                           &priv->bridge_pci_data.msi_lo);
> > > > > > > > +     pci_read_config_dword(parent, parent->msi_cap + PCI_M=
SI_ADDRESS_HI,
> > > > > > > > +                           &priv->bridge_pci_data.msi_hi);
> > > > > > > > +
> > > > > > > > +     pci_read_config_dword(parent, parent->pcie_cap + PCI_=
EXP_DEVCTL,
> > > > > > > > +                           &priv->bridge_pci_data.devctl);
> > > > > > > > +     pci_read_config_dword(parent, parent->pcie_cap + PCI_=
EXP_LNKCAP,
> > > > > > > > +                           &priv->bridge_pci_data.linkcap)=
;
> > > > > > > > +     pci_read_config_dword(parent, parent->pcie_cap + PCI_=
EXP_LNKCTL,
> > > > > > > > +                           &priv->bridge_pci_data.linkctl_=
sts);
> > > > > > > > +
> > > > > > > > +     pci_read_config_dword(parent, LS7A_GEN2_CTL, &priv->b=
ridge_pci_data.gen2_ctrl);
> > > > > > > > +     priv->bridge_pci_data.gen2_ctrl |=3D FIELD_PREP(LS7A_=
GEN2_SPEED_CHANG, 0x1)
> > > > > > > > +                                     | FIELD_PREP(LS7A_CON=
F_PHY_TX, 0x0);
> > > > > > > > +
> > > > > > > > +     pci_read_config_dword(parent, LS7A_SYMBOL_TIMER, &pri=
v->bridge_pci_data.symbol_timer);
> > > > > > > > +     priv->bridge_pci_data.symbol_timer |=3D LS7A_MASK_LEN=
_MATCH;
> > > > > > > > +
> > > > > > > > +     pci_read_config_dword(pdev, PCI_COMMAND, &priv->bmc_p=
ci_data.pci_command);
> > > > > > > > +     pci_read_config_dword(pdev, PCI_BASE_ADDRESS_0, &priv=
->bmc_pci_data.base_address0);
> > > > > > > > +     pci_read_config_dword(pdev, PCI_INTERRUPT_LINE, &priv=
->bmc_pci_data.interrupt_line);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static int ls2k_bmc_pdata_initial(struct pci_dev *pdev, st=
ruct ls2k_bmc_pdata *priv)
> > > > > > > > +{
> > > > > > > > +     int gsi =3D 16 + (LS2K_BMC_RESET_GPIO & 7);
> > > > > > > > +     void __iomem *gpio_base;
> > > > > > > > +     int irq, ret;
> > > > > > > > +
> > > > > > > > +     ls2k_bmc_save_pci_data(pdev, priv);
> > > > > > > > +
> > > > > > > > +     INIT_WORK(&priv->bmc_reset_work, ls2k_bmc_events_fn);
> > > > > > > > +
> > > > > > > > +     ret =3D devm_request_irq(&pdev->dev, pdev->irq, ls2k_=
bmc_interrupt,
> > > > > > > > +                            IRQF_SHARED | IRQF_TRIGGER_FAL=
LING, "ls2kbmc pcie", priv);
> > > > > > > > +     if (ret) {
> > > > > > > > +             dev_err(priv->dev, "LS2KBMC PCI-E request_irq=
(%d) failed\n", pdev->irq);
> > > > > > >
> > > > > > > Please don't use function names in error messages.
> > > > > > >
> > > > > > > Make them human readable inclusive of non-kernel engineers.
> > > > > >
> > > > > > How about:
> > > > > >
> > > > > > dev_err(ddata->dev, "Failed to request LS2KBMC PCI-E IRQ %d.\n"=
, pdev->irq);
> > > > > >
> > > > > > also, the error message regarding GPIO IRQ is as follows:
> > > > > >
> > > > > > dev_err(ddata->dev, "Failed to request LS2KBMC GPIO IRQ %d.\n",=
 irq);
> > > > >
> > > > > Yes, much better.
> > > > >
> > > > > [...]
> > > > >
> > > > > > > > +     priv =3D devm_kzalloc(&dev->dev, sizeof(*priv), GFP_K=
ERNEL);
> > > > > > > > +     if (IS_ERR(priv)) {
> > > > > > > > +             ret =3D -ENOMEM;
> > > > > > > > +             goto disable_pci;
> > > > > > > > +     }
> > > > > > > > +
> > > > > > > > +     priv->dev =3D &dev->dev;
> > > > > > > > +
> > > > > > > > +     ret =3D ls2k_bmc_pdata_initial(dev, priv);
> > > > > > >
> > > > > > > priv (ddata) already contains dev - you don't need both.
> > > > > >
> > > > > > Yes, we just pass priv(ddata), and
> > > > > >
> > > > > > struct pci_dev *pdev =3D to_pci_dev(ddata->dev);
> > > > >
> > > > > I would pass dev ... hold on, where do you store priv for reuse?
> > > >
> > > > Sorry, I am not entirely sure I understand your question. It does n=
ot
> > > > appear that priv needs to be reused.
> > >
> > > Then why does it exist at all?
> >
> > Emm...
> > Perhaps I have strayed from the topic of our discussion. Let's try to
> > get back on track.
> > After replying to your previous email, I thought about whether your
> > question was whether we need something similar to
> >
> > pci_set_drvdata(dev, priv);
> >
> > Looking at the code as a whole, perhaps it is because I am used to
> > using `priv` as a function parameter, so in most cases I use `priv`
> > directly, except in interrupt routines and INIT_WORK
> > I hope we are on the right track with our discussion.
>
> Okay, use priv for now.  But only pass other parameters when they cannot
> be derived from priv.  Also ddata tends to be preferred over priv in
> this subsystem.

Okay, if you don't mind me using `priv(ddata)` as the parameter for
ls2k_bmc_pdata_initial(), then my V8 patchset[1] has addressed all of
your comments in V7.

[1]: https://lore.kernel.org/all/cover.1752548073.git.zhoubinbin@loongson.c=
n/

>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

--=20
Thanks.
Binbin
