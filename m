Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816F463A0
	for <loongarch@lists.linux.dev>; Thu,  3 Nov 2022 18:28:55 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id n18so1701055qvt.11
        for <loongarch@lists.linux.dev>; Thu, 03 Nov 2022 11:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LswtbkOe8Jpt3/ohZfHWzj4HGhnDzB8AXLlogFH1CEM=;
        b=YNN45R2wSL/Vr7ici9veE9Q3LnwrdMqjskGqxZSMVK/TrLEJ9A5fZH5/h9MoyGkYmY
         x9nt4uZWvN4oZWQjVz+crZe2s1gG1TdSnblZ0Wp+FvPqxDtc6g+E/SW7jhDWemku8EiL
         XNxvZx3bn74bzijotAmhdWpaTfqC/VPJAKWx/mP687ADvLAXiG08MNVJa5OFihbL5YW9
         vQIkvYY8XOZFhfCpwVcDFfgTfUfSCptoX6bLK4pv0vsB8gIu+I8SSr5pYYtOSWMbyG9u
         QyNFVmnRtx46PUGkqyMYRu2JQYGooR/boAEH6v07A/WWC0Wt51E4K92Ly42QEAyZ0ywB
         DAyw==
X-Gm-Message-State: ACrzQf1UChvK8hIf9QI0XIZE0P8D2RDvFkbtGhunioFlU+axi1z07for
	LkIddSKM7H3cO+BzfE7pSuqME0QnT6liGsVOOF4=
X-Google-Smtp-Source: AMsMyM4rSHJNb7GzW1Vr+p+A/o5XzBdP7QVxZNHoEwaY20vKX4/wWkj6IkSkI6hn/Vol9jH1ZzDWwlZExlWc6PQPOTg=
X-Received: by 2002:ad4:5c47:0:b0:4bc:f84:da8f with SMTP id
 a7-20020ad45c47000000b004bc0f84da8fmr15759037qva.73.1667500134426; Thu, 03
 Nov 2022 11:28:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221102064750.2609503-1-chenhuacai@loongson.cn>
 <CAJZ5v0hLDm6Y7QR0azDKNo5eS9U6QkjZ9N-PkjnrSMLZK_07aQ@mail.gmail.com> <CAAhV-H4tQEz5QQurLzRxCe0Ct8Uu4ZZD6yjaRgh=r+V_2jQMPA@mail.gmail.com>
In-Reply-To: <CAAhV-H4tQEz5QQurLzRxCe0Ct8Uu4ZZD6yjaRgh=r+V_2jQMPA@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 3 Nov 2022 19:28:43 +0100
Message-ID: <CAJZ5v0i2mH=pCUX5qw7fqFB0feZM1f3jOiYuwGWEnNqBJW=09g@mail.gmail.com>
Subject: Re: [PATCH] Revert "LoongArch: Provisionally add ACPICA data structures"
To: Huacai Chen <chenhuacai@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>, 
	"Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	loongarch@lists.linux.dev, linux-pm@vger.kernel.org, 
	Xuefeng Li <lixuefeng@loongson.cn>, Jianmin Lv <lvjianmin@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 3, 2022 at 3:29 AM Huacai Chen <chenhuacai@kernel.org> wrote:
>
> Hi, Rafael,
>
> On Thu, Nov 3, 2022 at 3:59 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Wed, Nov 2, 2022 at 7:50 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
> > >
> > > This reverts commit af6a1cfa6859dab4a843 ("LoongArch: Provisionally add
> > > ACPICA data structures") to fix build error for linux-next on LoongArch,
> > > since acpica is merged to linux-pm.git now.
> > >
> > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> >
> > Would you mind if I added this to my acpica branch?
> >
> > There would be no cross-tree dependencies then.
> Emm, I hope this patch be merged via your acpi tree,

That's what I was asking about.

Applied now.

> and so does
> another patch named "ACPI / table: Print CORE_PIC information when
> MADT is parsed".

OK

> >
> > > ---
> > >  arch/loongarch/include/asm/acpi.h | 142 ------------------------------
> > >  1 file changed, 142 deletions(-)
> > >
> > > diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/include/asm/acpi.h
> > > index 17162f494b9b..825c2519b9d1 100644
> > > --- a/arch/loongarch/include/asm/acpi.h
> > > +++ b/arch/loongarch/include/asm/acpi.h
> > > @@ -31,148 +31,6 @@ static inline bool acpi_has_cpu_in_madt(void)
> > >
> > >  extern struct list_head acpi_wakeup_device_list;
> > >
> > > -/*
> > > - * Temporary definitions until the core ACPICA code gets updated (see
> > > - * 1656837932-18257-1-git-send-email-lvjianmin@loongson.cn and its
> > > - * follow-ups for the "rationale").
> > > - *
> > > - * Once the "legal reasons" are cleared and that the code is merged,
> > > - * this can be dropped entierely.
> > > - */
> > > -#if (ACPI_CA_VERSION == 0x20220331 && !defined(LOONGARCH_ACPICA_EXT))
> > > -
> > > -#define LOONGARCH_ACPICA_EXT   1
> > > -
> > > -#define        ACPI_MADT_TYPE_CORE_PIC         17
> > > -#define        ACPI_MADT_TYPE_LIO_PIC          18
> > > -#define        ACPI_MADT_TYPE_HT_PIC           19
> > > -#define        ACPI_MADT_TYPE_EIO_PIC          20
> > > -#define        ACPI_MADT_TYPE_MSI_PIC          21
> > > -#define        ACPI_MADT_TYPE_BIO_PIC          22
> > > -#define        ACPI_MADT_TYPE_LPC_PIC          23
> > > -
> > > -/* Values for Version field above */
> > > -
> > > -enum acpi_madt_core_pic_version {
> > > -       ACPI_MADT_CORE_PIC_VERSION_NONE = 0,
> > > -       ACPI_MADT_CORE_PIC_VERSION_V1 = 1,
> > > -       ACPI_MADT_CORE_PIC_VERSION_RESERVED = 2 /* 2 and greater are reserved */
> > > -};
> > > -
> > > -enum acpi_madt_lio_pic_version {
> > > -       ACPI_MADT_LIO_PIC_VERSION_NONE = 0,
> > > -       ACPI_MADT_LIO_PIC_VERSION_V1 = 1,
> > > -       ACPI_MADT_LIO_PIC_VERSION_RESERVED = 2  /* 2 and greater are reserved */
> > > -};
> > > -
> > > -enum acpi_madt_eio_pic_version {
> > > -       ACPI_MADT_EIO_PIC_VERSION_NONE = 0,
> > > -       ACPI_MADT_EIO_PIC_VERSION_V1 = 1,
> > > -       ACPI_MADT_EIO_PIC_VERSION_RESERVED = 2  /* 2 and greater are reserved */
> > > -};
> > > -
> > > -enum acpi_madt_ht_pic_version {
> > > -       ACPI_MADT_HT_PIC_VERSION_NONE = 0,
> > > -       ACPI_MADT_HT_PIC_VERSION_V1 = 1,
> > > -       ACPI_MADT_HT_PIC_VERSION_RESERVED = 2   /* 2 and greater are reserved */
> > > -};
> > > -
> > > -enum acpi_madt_bio_pic_version {
> > > -       ACPI_MADT_BIO_PIC_VERSION_NONE = 0,
> > > -       ACPI_MADT_BIO_PIC_VERSION_V1 = 1,
> > > -       ACPI_MADT_BIO_PIC_VERSION_RESERVED = 2  /* 2 and greater are reserved */
> > > -};
> > > -
> > > -enum acpi_madt_msi_pic_version {
> > > -       ACPI_MADT_MSI_PIC_VERSION_NONE = 0,
> > > -       ACPI_MADT_MSI_PIC_VERSION_V1 = 1,
> > > -       ACPI_MADT_MSI_PIC_VERSION_RESERVED = 2  /* 2 and greater are reserved */
> > > -};
> > > -
> > > -enum acpi_madt_lpc_pic_version {
> > > -       ACPI_MADT_LPC_PIC_VERSION_NONE = 0,
> > > -       ACPI_MADT_LPC_PIC_VERSION_V1 = 1,
> > > -       ACPI_MADT_LPC_PIC_VERSION_RESERVED = 2  /* 2 and greater are reserved */
> > > -};
> > > -
> > > -#pragma pack(1)
> > > -
> > > -/* Core Interrupt Controller */
> > > -
> > > -struct acpi_madt_core_pic {
> > > -       struct acpi_subtable_header header;
> > > -       u8 version;
> > > -       u32 processor_id;
> > > -       u32 core_id;
> > > -       u32 flags;
> > > -};
> > > -
> > > -/* Legacy I/O Interrupt Controller */
> > > -
> > > -struct acpi_madt_lio_pic {
> > > -       struct acpi_subtable_header header;
> > > -       u8 version;
> > > -       u64 address;
> > > -       u16 size;
> > > -       u8 cascade[2];
> > > -       u32 cascade_map[2];
> > > -};
> > > -
> > > -/* Extend I/O Interrupt Controller */
> > > -
> > > -struct acpi_madt_eio_pic {
> > > -       struct acpi_subtable_header header;
> > > -       u8 version;
> > > -       u8 cascade;
> > > -       u8 node;
> > > -       u64 node_map;
> > > -};
> > > -
> > > -/* HT Interrupt Controller */
> > > -
> > > -struct acpi_madt_ht_pic {
> > > -       struct acpi_subtable_header header;
> > > -       u8 version;
> > > -       u64 address;
> > > -       u16 size;
> > > -       u8 cascade[8];
> > > -};
> > > -
> > > -/* Bridge I/O Interrupt Controller */
> > > -
> > > -struct acpi_madt_bio_pic {
> > > -       struct acpi_subtable_header header;
> > > -       u8 version;
> > > -       u64 address;
> > > -       u16 size;
> > > -       u16 id;
> > > -       u16 gsi_base;
> > > -};
> > > -
> > > -/* MSI Interrupt Controller */
> > > -
> > > -struct acpi_madt_msi_pic {
> > > -       struct acpi_subtable_header header;
> > > -       u8 version;
> > > -       u64 msg_address;
> > > -       u32 start;
> > > -       u32 count;
> > > -};
> > > -
> > > -/* LPC Interrupt Controller */
> > > -
> > > -struct acpi_madt_lpc_pic {
> > > -       struct acpi_subtable_header header;
> > > -       u8 version;
> > > -       u64 address;
> > > -       u16 size;
> > > -       u8 cascade;
> > > -};
> > > -
> > > -#pragma pack()
> > > -
> > > -#endif
> > > -
> > >  #endif /* !CONFIG_ACPI */
> > >
> > >  #define ACPI_TABLE_UPGRADE_MAX_PHYS ARCH_LOW_ADDRESS_LIMIT
> > > --
> > > 2.31.1
> > >
> >
