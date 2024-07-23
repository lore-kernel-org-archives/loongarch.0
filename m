Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFB5152E15
	for <loongarch@lists.linux.dev>; Tue, 23 Jul 2024 13:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721741403; cv=none; b=d4RVjwggCRwAfs8m4/5V38PZ6fKfPpV+juN7tg/Umf2mavNzADoBm246F7t78nXjcBiEL+eZWzOQOw/U/ki0QdSo8R4l8YkpHOSqIKP6Xo+9O7JkHGq+ewdXAgM66uZTWP8aap/L8IQe7Duob8OTY7DHZkNkuI9Yin/qSf3Uj50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721741403; c=relaxed/simple;
	bh=nAOfBO2Y2r3svkakgl+lTAOtJTZk9SFbG5lphbRVNRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6Alac5pVAaXMbPx9qMZgO3n84Nkxkrl/sFjxsqjRdCxU56ormYEFxWOuQTtX/2Fw9BkmzBqYL+Ids270vItQDAjEoXjdI/ad3OBaxb3L/8pgHDPhpteyMT2KwGTcbswHV4zU+9n71KjDljYvggMDKRKNLcBblqQawjBIJTHCjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=frxp72/k; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="frxp72/k"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7f9be1f6cdbso186194439f.1
        for <loongarch@lists.linux.dev>; Tue, 23 Jul 2024 06:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721741400; x=1722346200; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hLXpOJ5NKoFQFTZD98u7pTCjufqwrqSU5zSslcWK47s=;
        b=frxp72/kiodCYPKf+AFGopMS209gWGPvligwgc17SDIzNjI+Fe9CrHGkJP2vodWvs6
         53zQlRqPmRZY1cudq09gzA7XZQEMMn5XPUUhKh/U8UODtvUBi3Gv9RjOKfirlAfVdRSh
         BQyXYRwdMT/h2fhNPn7Y+jvx6Ud3nCSf6c8D1X1u/WtusI1cNDqKFn5DTuUQQVw+KKht
         z4quTM745WVTnB/QvXwhYn6zMGxFYM9oQ7TYYRzOnfCRECH1uthIV/8BtX33B3c/NTNd
         o/uiLZm/DGKLx22hQAgSMAgKN3Hon2Y7CCOReAwAaKtucQdCDUqR03G6r4Nrs1/Eh/r/
         Nn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721741400; x=1722346200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLXpOJ5NKoFQFTZD98u7pTCjufqwrqSU5zSslcWK47s=;
        b=rc5iTHxiGnGx/DbFe0GfzN5iS5kXzZ58EhCXXCeKA4vMmvBHS6T9pevOs2asMapEAt
         LORZc3XBHrvsXsWRQbE65F1SZKw9clS1DBkCr81iNntG6AAyTNrHkmaaAeMrCvE4ebom
         +dJ1We1WeQGHowDi6f0TxDgYRM6U14Zt/k+elkcPGzxOI5a4+CoDfQbSI3eEJlSsjHjN
         p80auVWKyH8lkGhU8NJMaJJwr2hA12oGAcd/UqmTy4uB6ogEp3Ei9b4FJi1OVA6yyFX8
         x2/Wg5sZuS9M0pRdnhhLIAKekuiCYBiGYgqUHNzuy/M6OsJt+/kJl9/c+caHw/WUF+bR
         KOAA==
X-Forwarded-Encrypted: i=1; AJvYcCVRLZEsLVA0yDzKP9jlaeU0aGH0wZO2PsLtW2zmQCvINU0jiTM0hbAOEybstY6dQzk1Udp/w8/6ffuiUH6uR0AJPbqVbDM3gvjK
X-Gm-Message-State: AOJu0YyLCw9Qe5xCDlSA3/O+5sy4lDpY7b2vLr0SRwpgTugejtAd4lE3
	MOdJEeXq/Zqp5dZyhOuofXe2kTd6gu06MVLxOpOY6+tipucLMbSbi7RlJeGvdxo=
X-Google-Smtp-Source: AGHT+IF80eTqdhOJ79Y+uIGpgNKKtwlWUq1s4pL4fYqejLfcrt2vZMzY19zIDC9qjGAE1kLmyRI9aw==
X-Received: by 2002:a05:6602:2dd3:b0:804:9060:c0b8 with SMTP id ca18e2360f4ac-81b362aade3mr1199303039f.15.1721741400383;
        Tue, 23 Jul 2024 06:30:00 -0700 (PDT)
Received: from localhost ([138.199.100.237])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-81bed28605esm197619739f.47.2024.07.23.06.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:30:00 -0700 (PDT)
Date: Tue, 23 Jul 2024 08:29:57 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: sunilvl@ventanamicro.com, arnd@arndb.de, xiaobo55x@gmail.com, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anup Patel <anup@brainfault.org>, Charlie Jenkins <charlie@rivosinc.com>, 
	Baoquan He <bhe@redhat.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Zong Li <zong.li@sifive.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Chen Jiahao <chenjiahao16@huawei.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	James Morse <james.morse@arm.com>, Evan Green <evan@rivosinc.com>, Zhao Ke <ke.zhao@shingroup.cn>, 
	Thomas Gleixner <tglx@linutronix.de>, Andy Chiu <andy.chiu@sifive.com>, Marc Zyngier <maz@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Alison Schofield <alison.schofield@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Robert Richter <rrichter@amd.com>, 
	Yuntao Wang <ytcoode@gmail.com>, Dave Jiang <dave.jiang@intel.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 1/4] ACPI: RISCV: Add NUMA support based on SRAT and
 SLIT
Message-ID: <20240723-23811cc47f7863d12b6a78e8@orel>
References: <cover.1718268003.git.haibo1.xu@intel.com>
 <65dbad1fda08a32922c44886e4581e49b4a2fecc.1718268003.git.haibo1.xu@intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65dbad1fda08a32922c44886e4581e49b4a2fecc.1718268003.git.haibo1.xu@intel.com>

On Thu, Jun 13, 2024 at 04:54:33PM GMT, Haibo Xu wrote:
> Add acpi_numa.c file to enable parse NUMA information from
> ACPI SRAT and SLIT tables. SRAT table provide CPUs(Hart) and
> memory nodes to proximity domain mapping, while SLIT table
> provide the distance metrics between proximity domains.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/include/asm/acpi.h |  15 +++-
>  arch/riscv/kernel/Makefile    |   1 +
>  arch/riscv/kernel/acpi.c      |   5 --
>  arch/riscv/kernel/acpi_numa.c | 131 ++++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/setup.c     |   4 +-
>  arch/riscv/kernel/smpboot.c   |   2 -
>  include/linux/acpi.h          |   6 ++
>  7 files changed, 154 insertions(+), 10 deletions(-)
>  create mode 100644 arch/riscv/kernel/acpi_numa.c
> 
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> index 7dad0cf9d701..e0a1f84404f3 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -61,11 +61,14 @@ static inline void arch_fix_phys_package_id(int num, u32 slot) { }
>  
>  void acpi_init_rintc_map(void);
>  struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
> -u32 get_acpi_id_for_cpu(int cpu);
> +static inline u32 get_acpi_id_for_cpu(int cpu)
> +{
> +	return acpi_cpu_get_madt_rintc(cpu)->uid;
> +}
> +
>  int acpi_get_riscv_isa(struct acpi_table_header *table,
>  		       unsigned int cpu, const char **isa);
>  
> -static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
>  void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_size,
>  			     u32 *cboz_size, u32 *cbop_size);
>  #else
> @@ -87,4 +90,12 @@ static inline void acpi_get_cbo_block_size(struct acpi_table_header *table,
>  
>  #endif /* CONFIG_ACPI */
>  
> +#ifdef CONFIG_ACPI_NUMA
> +int acpi_numa_get_nid(unsigned int cpu);
> +void acpi_map_cpus_to_nodes(void);
> +#else
> +static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
> +static inline void acpi_map_cpus_to_nodes(void) { }
> +#endif /* CONFIG_ACPI_NUMA */
> +
>  #endif /*_ASM_ACPI_H*/
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 5b243d46f4b1..1e2afec141b5 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -110,3 +110,4 @@ obj-$(CONFIG_COMPAT)		+= compat_vdso/
>  
>  obj-$(CONFIG_64BIT)		+= pi/
>  obj-$(CONFIG_ACPI)		+= acpi.o
> +obj-$(CONFIG_ACPI_NUMA)	+= acpi_numa.o
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index e619edc8b0cc..040bdbfea2b4 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -191,11 +191,6 @@ struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
>  	return &cpu_madt_rintc[cpu];
>  }
>  
> -u32 get_acpi_id_for_cpu(int cpu)
> -{
> -	return acpi_cpu_get_madt_rintc(cpu)->uid;
> -}
> -
>  /*
>   * __acpi_map_table() will be called before paging_init(), so early_ioremap()
>   * or early_memremap() should be called here to for ACPI table mapping.
> diff --git a/arch/riscv/kernel/acpi_numa.c b/arch/riscv/kernel/acpi_numa.c
> new file mode 100644
> index 000000000000..0231482d6946
> --- /dev/null
> +++ b/arch/riscv/kernel/acpi_numa.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ACPI 6.6 based NUMA setup for RISCV
> + * Lots of code was borrowed from arch/arm64/kernel/acpi_numa.c
> + *
> + * Copyright 2004 Andi Kleen, SuSE Labs.
> + * Copyright (C) 2013-2016, Linaro Ltd.
> + *		Author: Hanjun Guo <hanjun.guo@linaro.org>
> + * Copyright (C) 2024 Intel Corporation.
> + *
> + * Reads the ACPI SRAT table to figure out what memory belongs to which CPUs.
> + *
> + * Called from acpi_numa_init while reading the SRAT and SLIT tables.
> + * Assumes all memory regions belonging to a single proximity domain
> + * are in one chunk. Holes between them will be included in the node.
> + */
> +
> +#define pr_fmt(fmt) "ACPI: NUMA: " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/bitmap.h>
> +#include <linux/kernel.h>
> +#include <linux/mm.h>
> +#include <linux/memblock.h>
> +#include <linux/mmzone.h>
> +#include <linux/module.h>
> +#include <linux/topology.h>
> +
> +#include <asm/numa.h>
> +
> +static int acpi_early_node_map[NR_CPUS] __initdata = { NUMA_NO_NODE };

This only sets acpi_early_node_map[0] to NUMA_NO_NODE. Assuming we want
to ensure all of them are initialized to NUMA_NO_NODE, then we need

static int acpi_early_node_map[NR_CPUS] __initdata = { [0 ... NR_CPUS - 1] = NUMA_NO_NODE };

Thanks,
drew
