Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2827E5
	for <loongarch@lists.linux.dev>; Fri,  4 Nov 2022 00:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971F7C43142
	for <loongarch@lists.linux.dev>; Fri,  4 Nov 2022 00:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667521223;
	bh=M9LmYO99kDc6aa+ZxDXmkvHvftfkjPIsAyEzsL0TVxA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UaD62jJFjihqGMb8cV+WX6Pce1hDoG40qxOJMpky6RlpWXXJ068DZx3l1zEBpjR0b
	 ObE1EI4ZnTZjPZ6pGwOvLPbIWZTdsVdK2hsysz/6gCfMJShFfJgKNbJjoRuoBAw2lb
	 7bb7ddeNZbHzqcHTgdJpWDlUW6oPgLO5ehkrht307/P9lq5QMUfdPtzTDGZgTXVBam
	 Ahx/cH0tHYCyv4jPr5C6kkIGVwrcZGeaTWcD3JiT7xmgulVQf5BBmMHDy3Rkyf3Ein
	 oHMAdyQTkqYLxEYLefAzG4Vma3rKyr5wvwKX4TImulnWglR5o/j55ylieaEocZVUAF
	 zE7EcCsIZ1Mqw==
Received: by mail-ej1-f49.google.com with SMTP id f5so9500398ejc.5
        for <loongarch@lists.linux.dev>; Thu, 03 Nov 2022 17:20:23 -0700 (PDT)
X-Gm-Message-State: ACrzQf3NQJngXHjxZE52/QDF0gUnuZk7AQQuLGVfSH8ZmWOzT9DyqS0+
	fU/v1KMgBjtPk76d0Yg7TyUojdF0EyIXLOIBqIc=
X-Google-Smtp-Source: AMsMyM5+aYzIYl5HwffMZA6M0uFAPYJJyQv8odvwFx2nC3FthODUsNhj4UNnmJAXUaPqea83JNXdAhLttnijpMh1YKI=
X-Received: by 2002:a17:906:5a45:b0:7ad:d250:b904 with SMTP id
 my5-20020a1709065a4500b007add250b904mr215917ejc.633.1667521221778; Thu, 03
 Nov 2022 17:20:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221102064838.2615669-1-chenhuacai@loongson.cn> <CAJZ5v0hi3cqjCH-2hGp9xeC4Ch5mA+V9Zb+D_mCqDViNA6Musg@mail.gmail.com>
In-Reply-To: <CAJZ5v0hi3cqjCH-2hGp9xeC4Ch5mA+V9Zb+D_mCqDViNA6Musg@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 4 Nov 2022 08:20:10 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4Bj+fJWCm8U7sw62X1CgUqn+rCgr32+r814cGN1Po3rg@mail.gmail.com>
Message-ID: <CAAhV-H4Bj+fJWCm8U7sw62X1CgUqn+rCgr32+r814cGN1Po3rg@mail.gmail.com>
Subject: Re: [PATCH] ACPI / table: Print CORE_PIC information when MADT is parsed
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, 
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@ucw.cz>, loongarch@lists.linux.dev, 
	linux-pm@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Jianmin Lv <lvjianmin@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 4, 2022 at 2:35 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Wed, Nov 2, 2022 at 7:50 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
> >
> > When MADT is parsed, print CORE_PIC information as below:
> >
> > ACPI: CORE PIC (processor_id[0x00] core_id[0x00] enabled)
> > ACPI: CORE PIC (processor_id[0x01] core_id[0x01] enabled)
> > ...
> > ACPI: CORE PIC (processor_id[0xff] core_id[0xff] enabled)
> >
> > This debug information will be very helpful to bring up early systems to
> > see if processor_id and core_id are matched or not as spec defined.
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  drivers/acpi/tables.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
> > index 47ec11d4c68e..23bff77b09f4 100644
> > --- a/drivers/acpi/tables.c
> > +++ b/drivers/acpi/tables.c
> > @@ -210,6 +210,16 @@ void acpi_table_print_madt_entry(struct acpi_subtable_header *header)
> >                 }
> >                 break;
> >
> > +       case ACPI_MADT_TYPE_CORE_PIC:
> > +               {
> > +                       struct acpi_madt_core_pic *p =
> > +                           (struct acpi_madt_core_pic *)header;
> > +                       pr_debug("CORE PIC (processor_id[0x%02x] core_id[0x%02x] %s)\n",
> > +                                p->processor_id, p->core_id,
> > +                                (p->flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
> > +               }
> > +               break;
> > +
> >         default:
> >                 pr_warn("Found unsupported MADT entry (type = 0x%x)\n",
> >                         header->type);
> > --
>
> Applied as 6.2 material.
>
> However, next time please CC ACPI-related patches to linux-acpi rather
> than to linux-pm (or you can do both if the patch is PM-related
> anyway).
Sorry, I will do that next time.

Huacai
>
> Thanks!
