Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22DA29A8
	for <loongarch@lists.linux.dev>; Thu,  3 Nov 2022 18:34:57 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id g10so1725398qkl.6
        for <loongarch@lists.linux.dev>; Thu, 03 Nov 2022 11:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fme8TpX7/aX6I0wUHkOV0EjnvReL60XkORWeEGO34oM=;
        b=1MCgWGHwbpC2W3mVOD6ACtAtZHeg6kn7ooSWjn98YbIX4mdaGqhyxegkBNflp/0SAq
         HO81DARBDSeR3JLyzoDWtAe4+2siS4CxX/QFc9DRgTzWmxB5dQW/6rzmTrux/Zezo6qZ
         pSTxSjLdZSwkL46iWx2725HiK56iYb26ZYfioWQgeRawI9z+DxfbKLscE2RANvpZTsIF
         yVdUZZ/LQ8Fsuf09LdSAg0uIRYNt27iX/hmflPYUwRCZ37WM0umtUalZ1jTV+ELR9O3d
         margyevyN4+QEyxy859vr/Jz7QI287WMiyA9QEZPbXIEzMeq84/OdmonhiWH8ecfKX4u
         zNZw==
X-Gm-Message-State: ACrzQf0K5UV7CgM5dKMZs6tQD2/CJqQxEVVkUlMO2KE6QbCHxAW+/axD
	avC/wPmW+gvo4GlbZf02oWbfm4e4yXmeLzFIZ6Q=
X-Google-Smtp-Source: AMsMyM7VMuMQnOTaWFYlaOGoRYgL/vknb0LyCbtSuxv/81b5hzsSHwf1rDWoR4eB7vHh+BH/EO4b2Rh5EBw4pkTzBdQ=
X-Received: by 2002:a37:65c9:0:b0:6fa:1ef8:fa10 with SMTP id
 z192-20020a3765c9000000b006fa1ef8fa10mr20190691qkb.648.1667500496799; Thu, 03
 Nov 2022 11:34:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221102064838.2615669-1-chenhuacai@loongson.cn>
In-Reply-To: <20221102064838.2615669-1-chenhuacai@loongson.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 3 Nov 2022 19:34:45 +0100
Message-ID: <CAJZ5v0hi3cqjCH-2hGp9xeC4Ch5mA+V9Zb+D_mCqDViNA6Musg@mail.gmail.com>
Subject: Re: [PATCH] ACPI / table: Print CORE_PIC information when MADT is parsed
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, 
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@ucw.cz>, loongarch@lists.linux.dev, 
	linux-pm@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Jianmin Lv <lvjianmin@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 2, 2022 at 7:50 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
>
> When MADT is parsed, print CORE_PIC information as below:
>
> ACPI: CORE PIC (processor_id[0x00] core_id[0x00] enabled)
> ACPI: CORE PIC (processor_id[0x01] core_id[0x01] enabled)
> ...
> ACPI: CORE PIC (processor_id[0xff] core_id[0xff] enabled)
>
> This debug information will be very helpful to bring up early systems to
> see if processor_id and core_id are matched or not as spec defined.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  drivers/acpi/tables.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
> index 47ec11d4c68e..23bff77b09f4 100644
> --- a/drivers/acpi/tables.c
> +++ b/drivers/acpi/tables.c
> @@ -210,6 +210,16 @@ void acpi_table_print_madt_entry(struct acpi_subtable_header *header)
>                 }
>                 break;
>
> +       case ACPI_MADT_TYPE_CORE_PIC:
> +               {
> +                       struct acpi_madt_core_pic *p =
> +                           (struct acpi_madt_core_pic *)header;
> +                       pr_debug("CORE PIC (processor_id[0x%02x] core_id[0x%02x] %s)\n",
> +                                p->processor_id, p->core_id,
> +                                (p->flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
> +               }
> +               break;
> +
>         default:
>                 pr_warn("Found unsupported MADT entry (type = 0x%x)\n",
>                         header->type);
> --

Applied as 6.2 material.

However, next time please CC ACPI-related patches to linux-acpi rather
than to linux-pm (or you can do both if the patch is PM-related
anyway).

Thanks!
