Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5807B
	for <loongarch@lists.linux.dev>; Thu, 20 Oct 2022 11:50:05 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a26so46380744ejc.4
        for <loongarch@lists.linux.dev>; Thu, 20 Oct 2022 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m3PUJag6EKCr9rB7KUzAqIPe61hzJ7dJryShnMPOsoQ=;
        b=WSgIugaODje1hDAyzW/4EIep0dxZ46LydLCjigdsyWWmUEkH+/ZBImfV/w4e4+UBst
         MoVmDgx/t7vUkoAZrMKZ5zLTWw29gWdENLntGBDeY1KwfnRN2zSCId1WdvVqP/DIb26Y
         PPsfwUIDkYAHQlG+DV2Y5lYcbwsPARETTL2mzhjadRNfWFuiM5KpFTi+HGtjZoNPR9th
         RxPOFYW1u0q4KGCfq4j+TblCJW7N75GAcliXYjJW0GFrH/n784WB+xB4CIcNL/bJ9pgc
         tUIdUbzRKrIy1On+x/zVPzG6YsWLeJHtyg6FSVfk0hXeIxJLQmpAUgVOPtQJa1/+41Bg
         S3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3PUJag6EKCr9rB7KUzAqIPe61hzJ7dJryShnMPOsoQ=;
        b=JrcVYfe9mSdzbe3PiDXr8kkqiYyb0Suev1OhESsGviWu2ee+WHUSkPhwpxcm6fFbqw
         vsbNeH6qB6z6AWWisCu4ER2o2skvymUCoQdjG3H1aKdjpdPVNx2Uuagzoc+DP7bOuyPv
         XwOVjIr7mjRtT4ACNb5OJ+Bd7GDxj4O093EtnJ+kBcAIVC6bwArBrm69cZ2C16FHEVHd
         cK3u4HcRadiKwwLPDZu6hiu3L6pN5TM5hmkeEi5fUBuR+WA1Big6CiKh+bJerVlGUg4N
         lhlQcDLOBueQ1MN9f4D4JQUKJgknl017haKvZaKKBRioMugdBFzvu3in9VS2xwu0vH1N
         sAog==
X-Gm-Message-State: ACrzQf3kYM1Pa0LLcHrT98xBasDKxYDZY+5SjEHFk/w8SxeFmDjh0FMA
	R7d9tFeNQCA9zKJi2iHhycUTaRGQsv0oTgf9wLI=
X-Google-Smtp-Source: AMsMyM6JK3W2cnT8tQQj3eDJV2AkrKKgR98zJIKM9rEX++4sZidDhW330se5lM2PIMr+h7UhM5xxOJh2Xys36CeZfN0=
X-Received: by 2002:a17:906:fe45:b0:788:15a5:7495 with SMTP id
 wz5-20020a170906fe4500b0078815a57495mr10746328ejb.633.1666266603661; Thu, 20
 Oct 2022 04:50:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221020073346.536494-1-chenhuacai@loongson.cn> <864jvyg2qc.wl-maz@kernel.org>
In-Reply-To: <864jvyg2qc.wl-maz@kernel.org>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Thu, 20 Oct 2022 19:49:51 +0800
Message-ID: <CAAhV-H5HrW__JCzGa88Ta0bmogEKyGOYi1G_2q7YMe+xU0rU3Q@mail.gmail.com>
Subject: Re: [PATCH] irqchip/loongarch: Adjust acpi_cascade_irqdomain_init()
 and sub-routines
To: Marc Zyngier <maz@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Xuefeng Li <lixuefeng@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 20, 2022 at 7:21 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 20 Oct 2022 08:33:46 +0100,
> Huacai Chen <chenhuacai@loongson.cn> wrote:
> >
> > 1, Adjust prototype of acpi_cascade_irqdomain_init() because we don't
> >    need its return value.
> > 2, Combine unnecessary short lines to one long line.
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  drivers/irqchip/irq-loongarch-cpu.c    | 19 +++++++------------
> >  drivers/irqchip/irq-loongson-eiointc.c | 19 +++++++------------
> >  drivers/irqchip/irq-loongson-pch-pic.c | 11 ++++-------
> >  3 files changed, 18 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-loongarch-cpu.c b/drivers/irqchip/irq-loongarch-cpu.c
> > index 741612ba6a52..093609c8eaa7 100644
> > --- a/drivers/irqchip/irq-loongarch-cpu.c
> > +++ b/drivers/irqchip/irq-loongarch-cpu.c
> > @@ -92,31 +92,26 @@ static const struct irq_domain_ops loongarch_cpu_intc_irq_domain_ops = {
> >       .xlate = irq_domain_xlate_onecell,
> >  };
> >
> > -static int __init
> > -liointc_parse_madt(union acpi_subtable_headers *header,
> > -                    const unsigned long end)
> > +static int __init liointc_parse_madt(union acpi_subtable_headers *header,
> > +                                     const unsigned long end)
> >  {
> >       struct acpi_madt_lio_pic *liointc_entry = (struct acpi_madt_lio_pic *)header;
> >
> >       return liointc_acpi_init(irq_domain, liointc_entry);
> >  }
> >
> > -static int __init
> > -eiointc_parse_madt(union acpi_subtable_headers *header,
> > -                    const unsigned long end)
> > +static int __init eiointc_parse_madt(union acpi_subtable_headers *header,
> > +                                     const unsigned long end)
> >  {
> >       struct acpi_madt_eio_pic *eiointc_entry = (struct acpi_madt_eio_pic *)header;
> >
> >       return eiointc_acpi_init(irq_domain, eiointc_entry);
> >  }
> >
> > -static int __init acpi_cascade_irqdomain_init(void)
> > +static void __init acpi_cascade_irqdomain_init(void)
> >  {
> > -     acpi_table_parse_madt(ACPI_MADT_TYPE_LIO_PIC,
> > -                           liointc_parse_madt, 0);
> > -     acpi_table_parse_madt(ACPI_MADT_TYPE_EIO_PIC,
> > -                           eiointc_parse_madt, 0);
> > -     return 0;
> > +     acpi_table_parse_madt(ACPI_MADT_TYPE_LIO_PIC, liointc_parse_madt, 0);
> > +     acpi_table_parse_madt(ACPI_MADT_TYPE_EIO_PIC, eiointc_parse_madt, 0);
>
> This definitely looks like it is moving in the wrong direction. The
> parsing can return an error, and you're not handling it anywhere.
> Given how often firmware tables are broken, this seems pretty bad.
Oh, I'm sorry, I have misunderstood your reply in another thread. :(

Huacai
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
