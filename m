Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D8328683
	for <loongarch@lists.linux.dev>; Wed, 10 Jul 2024 03:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720580681; cv=none; b=dIvYherlNZrH5drGC6jqP6zq11dk8j4qyDihjYoe5adiofz6ZVA7uVCAqJ3sJPeZeOF1Z3K0JTiSDS8M/ZHJaJWsPhIsBitNw8Sz0uIObYSPh2984LJmxGNZkk0VPRo4n6dCSytyHDV3x7t3O8qCKOlldlzjjjFAvtcObl/tGyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720580681; c=relaxed/simple;
	bh=AQz3Cv2NIz7LkfUyRe1/U1+XxUvl5V1K9MXenuYDXR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VbYkSRxF3dvabE4anDmYKq15rQkcnljzM05nUlACZC1aTw7N7Mc/iAAxo6n5LO6gD16T8K+f1hpvh7NIzZAsY8n46n7d8sFBTiEpfydYCRGbPCGXlJ1ySjeJgAkyWDDIEu2dZbVGs1kUL/J8/HAzQVu3OHvAxL6yvVs6Ql6+qBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUNvr5XC; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUNvr5XC"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7979c3ffb1so17760666b.2
        for <loongarch@lists.linux.dev>; Tue, 09 Jul 2024 20:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720580678; x=1721185478; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IiRh6FzC2PDiy7SQD4Z/jXEccHUb8k/3zJYxkqcVVSE=;
        b=XUNvr5XCZDsV54Ye53G7BEdkNjKRf/jsUyh4c3kYsLUSNd0irZyZRYkSOIF+iAUhuU
         WOahHp1IcL63Y6T9iy1Xba6GnRamUfc7bkaLW+ZTzxkC57ZgzVcz+bKZyd19ExqzkhOx
         DuR3kUDVh9GEvpojOsgvHdTu7+9/qZumsF2syMgHBjtNbiX8WN6OXXRcqsGteRZ5PMBI
         lmAaUls6KMmJV4XZ6HDA2lruurj9Ir/3ET1W/FG/ig18ClAI/tIjgVvUndqVhjHWe7Ot
         lh0FjZJng3cJg3+RVe5HAA8FEvpe2hPfWbHy0cEG28Wi9zDpsWU4KcgYdT5NYeifoXTb
         cENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720580678; x=1721185478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IiRh6FzC2PDiy7SQD4Z/jXEccHUb8k/3zJYxkqcVVSE=;
        b=GKqOAkmQC5CO/rRvn9tgmWBtwKTrUqZPWTAioeziZYQwc4+dksT2BG17/46VAxumzV
         0aNpLAV/25IzXZYMph6IZVjwikmWeqMZ5U99DdYRn3sBq2Gmguqvs0iNt8HXOY0ZSSRZ
         DNpPh7WqqUT2jFyXuvlnvpOhQl6p/9FZzBDao9dueFKM6VTBIDRLCucxK9V3HyhAPsJR
         kkoPC8MqslMdYySz+rogu18HwbtQYDr2BU0fRMTTo8KK04CLE3G7KN6hB6D05jW69+cH
         YCUEScGyM28fVEgaf3bPgcDoiV2mbZbe8xcyn+Vt+ZHzTbHhIHYI5F08PRVvrsOajLWY
         QTxA==
X-Forwarded-Encrypted: i=1; AJvYcCXDP98dNev3qmV2C05mCo816Z8zNWiIXmP3DDoGiCaMn50l2wtSodGkt59boSlDoS9kyGehdEcq4UbZ3RQViDYvwWPmeIOmi+tw
X-Gm-Message-State: AOJu0YyAwQ0/OI1BevMSzMZ2ykvV/p6mKakcK2Mo1+gc8CTXBBwIvO4X
	TLm7nYTN22eqAdI7MZ7WRTOOvs0LbFGlaFDy6Wdj4acfjoCqqeFiwyvaeHJ0NjmWocSWwwISd4u
	PoGVsz74uKZxoFfewd1bkydM9Wkk=
X-Google-Smtp-Source: AGHT+IF862RAyNxSA5v3VYIjwsLWIcnaqFyQPzreBRTwDVIrswUJU+XfQifI+N27WlvTLi3Rpwz9+OQ3NvNuPGwp1Ks=
X-Received: by 2002:a50:fb0b:0:b0:57d:42f6:63fe with SMTP id
 4fb4d7f45d1cf-594bb773f1bmr3432494a12.22.1720580677246; Tue, 09 Jul 2024
 20:04:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240612065315.2048110-1-chenhuacai@loongson.cn> <20240709212414.GA195866@bhelgaas>
In-Reply-To: <20240709212414.GA195866@bhelgaas>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Wed, 10 Jul 2024 11:04:24 +0800
Message-ID: <CAAhV-H6=nOf_cSv7K3hS3jdXsGcWR7Go30EFyZeqxYNQKhtH8A@mail.gmail.com>
Subject: Re: [PATCH] PCI: loongson: Add LS7A MSI enablement quirk
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, loongarch@lists.linux.dev, linux-pci@vger.kernel.org, 
	Jianmin Lv <lvjianmin@loongson.cn>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org, 
	Sheng Wu <wusheng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bjorn,

On Wed, Jul 10, 2024 at 5:24=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Wed, Jun 12, 2024 at 02:53:15PM +0800, Huacai Chen wrote:
> > LS7A chipset can be used as a downstream bridge which connected to a
> > high-level host bridge. In this case DEV_LS7A_PCIE_PORT5 is used as the
> > upward port. We should always enable MSI caps of this port, otherwise
> > downstream devices cannot use MSI.
>
> Can you clarify this topology a bit?  Since DEV_LS7A_PCIE_PORT5
> apparently has a class of PCI_CLASS_BRIDGE_HOST, I guess that in PCIe
> terms, it is basically a PCI host bridge (Root Complex, if you prefer)
> that is materialized as a PCI Endpoint?
Now most of the existing LoongArch CPUs don't have an integrated PCIe
RC, instead they have HyperTransport controllers. But the latest CPU
(Loongson-3C6000) has an integrated PCIe RC and removed
HyperTransport.

LS7A bridge can work together with both old (HT) CPUs and new (PCIe)
CPUs. If it is connected to an old CPU, its upstream port is a HT
port, and DEV_LS7A_PCIE_PORT5 works as a normal downstream PCIe port.
If it is connected to a new CPU, DEV_LS7A_PCIE_PORT5 works as an
upstream port (the class code becomes PCI_CLASS_BRIDGE_HOST) and the
HT port is idle.

>
> I'm curious about what's going on here because the normal PCI MSI
> support should set PCI_MSI_FLAGS_ENABLE since it's completely
> specified by the spec, which says it controls whether *this function*
> can use MSI.
>
> But in this case PCI_MSI_FLAGS_ENABLE seems to have non-architected
> behavior of controlling MSI from *other* devices below this host
> bridge?  That's a little bit weird too because MSI looks like DMA to
> any bridges upstream from the device that is using MSI, and the Bus
> Master Enable bit in those bridges controls whether they forward those
> MSI DMA accesses upstream.  And of course the PCI core should already
> make sure those bridges have Bus Master Enable set when downstream
> devices use MSI.
In my opinion this is a hardware bug, when DEV_LS7A_PCIE_PORT5 works
as a host bridge, it should enable MSI automatically. But
unfortunately hardware doesn't behave like this, so we need a quirk
here.

Huacai

>
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Sheng Wu <wusheng@loongson.cn>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  drivers/pci/controller/pci-loongson.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/pci/controller/pci-loongson.c b/drivers/pci/contro=
ller/pci-loongson.c
> > index 8b34ccff073a..ffc581605834 100644
> > --- a/drivers/pci/controller/pci-loongson.c
> > +++ b/drivers/pci/controller/pci-loongson.c
> > @@ -163,6 +163,18 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_LOONGSON,
> >  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_LOONGSON,
> >                       DEV_LS7A_HDMI, loongson_pci_pin_quirk);
> >
> > +static void loongson_pci_msi_quirk(struct pci_dev *dev)
> > +{
> > +     u16 val, class =3D dev->class >> 8;
> > +
> > +     if (class =3D=3D PCI_CLASS_BRIDGE_HOST) {
> > +             pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &=
val);
> > +             val |=3D PCI_MSI_FLAGS_ENABLE;
> > +             pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, =
val);
> > +     }
> > +}
> > +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_LOONGSON, DEV_LS7A_PCIE_PORT5, l=
oongson_pci_msi_quirk);
> > +
> >  static struct loongson_pci *pci_bus_to_loongson_pci(struct pci_bus *bu=
s)
> >  {
> >       struct pci_config_window *cfg;
> > --
> > 2.43.0
> >
