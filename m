Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC906ABC
	for <loongarch@lists.linux.dev>; Sun, 10 Sep 2023 15:51:36 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5657add1073so2354526a12.0
        for <loongarch@lists.linux.dev>; Sun, 10 Sep 2023 08:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694361096; x=1694965896; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Khig5fiAk2UrEWc554zDncIUcso6vVaeyXzrWK+GM7s=;
        b=lOFNvAwmMkTKu9ljtE1o+V0eKG3Xr6TGsETGsfykZ0wrelQ0LlxgJDyyHKokMZwFED
         aSld4FqDwtaSIJ40Q6aOfr0fpGgd4uUfOn94UW4U1If7kNUZWgCjoRkNvBR2IJVfPQPN
         P/ZTJu4MPAfE5cx9J8IkdlrNUJWncVkZw0I3aoA0LSgCMKu60iofSuL9VSU+0LVHrV9E
         NUYLsHlDDdLwX3qOxSQ99GBFIvJjx/Xh/ftr2o/SEaabj0EFIQkBMFlOHRhacM4FNYuD
         3f3qDNyXk6QjZ6BRxjBuscDgUiK22Sfp0g3zBAzl5nXx71fy0uu9yy/oftF4SPtQrc7T
         q+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694361096; x=1694965896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Khig5fiAk2UrEWc554zDncIUcso6vVaeyXzrWK+GM7s=;
        b=FXqRWB16A5ktWCGt5PTWiMoQ3kANytkSqok/FQcESSJTCheo1R3cnjq1afBEqZzrtv
         DMN29ayXM9Iu8RZEmEIZU5DBq/HP6BEiuAR5MOQMy58Bn9LU2fFR0X6LMVi3tr/KEAin
         a40HlLZSGIr0Y6Wft2c78PePTo4x0DqOa5dZuQOgNwJNZBZaLMrHdSYqztQZXT1xzOD2
         9Mj/17MD+MECgTvvuav6O8IzMI5/pVXVaDPdwH2m0I0jUuBj5yYe903KCJ98xPFyhVFM
         oulOfQXSO7/RcN+YP8LyJ07g5yvMFr9jkXpaGaoLQFDFGqYtDNOoewQMy6nom6/BUL8q
         ACjg==
X-Gm-Message-State: AOJu0Yw17tVJuVxS5q0eEy7dr3g87xsuccPAgBqfYjVbYPOU7zQqLB62
	HXUoIRXWpbdn6aRF/rbc6Wc=
X-Google-Smtp-Source: AGHT+IGfgHpKwKZHNeO/0ZoB0iKWvIQcqllCgij4Q4Gf00JZ46jSA8iYSr3FBV1wufNNVSl/tZSASA==
X-Received: by 2002:a17:90b:33c2:b0:267:f8f4:73ab with SMTP id lk2-20020a17090b33c200b00267f8f473abmr14111217pjb.16.1694361095692;
        Sun, 10 Sep 2023 08:51:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w30-20020a17090a6ba100b0026b3a86b0d5sm4557834pjj.33.2023.09.10.08.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 08:51:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 10 Sep 2023 08:51:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: chenhuacai@kernel.org, dvyukov@google.com, andreyknvl@gmail.com,
	loongarch@lists.linux.dev, kasan-dev@googlegroups.com,
	chris.chenfeiyang@gmail.com, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH 2/2] LoongArch: Allow building with kcov coverage
Message-ID: <66522279-c933-4952-9a5a-64301074a74a@roeck-us.net>
References: <cover.1688369658.git.chenfeiyang@loongson.cn>
 <8d10b1220434432dbc089fab8df4e1cca048cd0c.1688369658.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d10b1220434432dbc089fab8df4e1cca048cd0c.1688369658.git.chenfeiyang@loongson.cn>

Hi,

On Tue, Jul 04, 2023 at 08:53:32PM +0800, Feiyang Chen wrote:
> Add ARCH_HAS_KCOV to the LoongArch Kconfig. Also disable
> instrumentation of vdso.
> 
> Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>

When trying to build loongarch:allmodconfig, this patch results in

Error log:
In file included from /opt/kernel/gcc-12.2.0-2.39-nolibc/loongarch64-linux-gnu/bin/../lib/gcc/loongarch64-linux-gnu/12.2.0/plugin/include/options.h:8,
                 from /opt/kernel/gcc-12.2.0-2.39-nolibc/loongarch64-linux-gnu/bin/../lib/gcc/loongarch64-linux-gnu/12.2.0/plugin/include/tm.h:46,
                 from /opt/kernel/gcc-12.2.0-2.39-nolibc/loongarch64-linux-gnu/bin/../lib/gcc/loongarch64-linux-gnu/12.2.0/plugin/include/backend.h:28,
                 from /opt/kernel/gcc-12.2.0-2.39-nolibc/loongarch64-linux-gnu/bin/../lib/gcc/loongarch64-linux-gnu/12.2.0/plugin/include/gcc-plugin.h:30,
                 from scripts/gcc-plugins/gcc-common.h:7,
                 from scripts/gcc-plugins/latent_entropy_plugin.c:78:
/opt/kernel/gcc-12.2.0-2.39-nolibc/loongarch64-linux-gnu/bin/../lib/gcc/loongarch64-linux-gnu/12.2.0/plugin/include/config/loongarch/loongarch-opts.h:31:10: fatal error: loongarch-def.h: No such file or directory
   31 | #include "loongarch-def.h"

for me. I tried with gcc 12.2 / binutils 2.39 and gcc 13.1 / binutils 2.40.

Reverting the patch or explicitly disabling CONFIG_GCC_PLUGINS fixes
the problem.

What compiler / binutils version combination is needed for this to work,
or, alternatively, how would I have to configure the compiler ?

Thanks,
Guenter

> ---
>  arch/loongarch/Kconfig       | 1 +
>  arch/loongarch/vdso/Makefile | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index ed9a148cdcde..4c21a961ab88 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -14,6 +14,7 @@ config LOONGARCH
>  	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
>  	select ARCH_HAS_CPU_FINALIZE_INIT
>  	select ARCH_HAS_FORTIFY_SOURCE
> +	select ARCH_HAS_KCOV
>  	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
>  	select ARCH_HAS_PTE_SPECIAL
>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
> diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
> index 7bb794604af3..7dc87377688b 100644
> --- a/arch/loongarch/vdso/Makefile
> +++ b/arch/loongarch/vdso/Makefile
> @@ -5,6 +5,8 @@ ifdef CONFIG_KASAN
>  KASAN_SANITIZE := n
>  endif
>  
> +KCOV_INSTRUMENT := n
> +
>  # Include the generic Makefile to check the built vdso.
>  include $(srctree)/lib/vdso/Makefile
>  
> -- 
> 2.39.3
> 
