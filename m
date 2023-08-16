Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EE41094D
	for <loongarch@lists.linux.dev>; Wed, 16 Aug 2023 14:37:46 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1bba48b0bd2so44464005ad.3
        for <loongarch@lists.linux.dev>; Wed, 16 Aug 2023 07:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1692196666; x=1692801466;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jX0eyRgUBnlJvg52xTw9Xc/nvpJnbIOrZesRtyij778=;
        b=VADZ6ppYOIa12yuHDDWB5op2QcT1ODlbktFBmeFlKBoEMxCqDrHzlC57HCdHM53VZk
         nGobevQw5NR9tdtnclAESo5/bqz2RjxBOH+/5ozgRSmZjDK/8MSp0wYJo0onv64L6T/4
         ij0Qc9KG4iqGvAY9QHMAlvDyevSJLWPIrZxuKwhXi0NBgHH3BuSRPxrE6kA4R7dMipF3
         UvYtMXp/9a0HA/yKHx3EeAjfklPYz2PMqqsOYhzJLOKAN4wv3z/zR3SWG6COhDN4yoEm
         XU5DbUI4Ym4HEuBQx9VCk5wy5N16kCRrk6DcFRgAS62yilcVX30qkFM+mOqKS7tQCNeR
         h3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692196666; x=1692801466;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jX0eyRgUBnlJvg52xTw9Xc/nvpJnbIOrZesRtyij778=;
        b=XiJt6gbxan3gD87OAjSb8E2kL2nUEQx8gz/YpNJpZiyZdRnsi1I9un2lwKLEi4d9fk
         U5Jt1BVIPeLWfRvL00QqGvjcyshdwgEQo4stReaOfsjrSOC4MB/mwUcqj57/izSGL20e
         UYd4+/8Yqyny//XppyOGxNFhS5+sH7bj1F5plUO+wdTdVhuGL+owqy477Mf5VLLcR+d9
         WTOBeoLk03MT+IeezV1yBLZbcbCniCOaLTHedYJlM0pfKYNGKNI67xF1QHh2h0ReDC4o
         pAbQr0a+kT0yk+tz15fvRZBsejR8VLmk8GBHmFp869xrObFasjt5la1SI20krhGtv38n
         oGmg==
X-Gm-Message-State: AOJu0YxVP+N/6RYz4rQ47pEokPBylADZFAy2fdQ9PJtL1kd/8yxqXVrV
	HGQ8j7KIXp4xlAQtjEUoOvdKeA==
X-Google-Smtp-Source: AGHT+IGcLRV9xPE8O/Y0r7BvxOGUyPtSc05frmq3YqIOYUpUlkYPwvMsDcG3F9VECZ6GEmz4LjGLJQ==
X-Received: by 2002:a17:903:44e:b0:1bb:fffd:63d8 with SMTP id iw14-20020a170903044e00b001bbfffd63d8mr1911272plb.36.1692196665787;
        Wed, 16 Aug 2023 07:37:45 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id iw10-20020a170903044a00b001bdd7579b5dsm7164476plb.240.2023.08.16.07.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:37:44 -0700 (PDT)
Date: Wed, 16 Aug 2023 07:37:44 -0700 (PDT)
X-Google-Original-Date: Wed, 16 Aug 2023 07:37:42 PDT (-0700)
Subject:     Re: [PATCH] asm-generic: partially revert "Unify uapi bitsperlong.h for arm64, riscv and loongarch"
In-Reply-To: <20230811204930.1529925-1-arnd@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, yangtiezhu@loongson.cn, loongarch@lists.linux.dev,
  kernel@xen0n.name, chenhuacai@kernel.org, Arnd Bergmann <arnd@arndb.de>, nathan@kernel.org,
  linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: arnd@kernel.org
Message-ID: <mhng-2cdb59cc-0177-47a9-af49-06d8853f56aa@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Fri, 11 Aug 2023 13:49:07 PDT (-0700), arnd@kernel.org wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Unifying the asm-generic headers across 32-bit and 64-bit architectures
> based on the compiler provided macros was a good idea and appears to work
> with all user space, but it caused a regression when building old kernels
> on systems that have the new headers installed in /usr/include, as this
> combination trips an inconsistency in the kernel's own tools/include
> headers that are a mix of userspace and kernel-internal headers.
>
> This affects kernel builds on arm64, riscv64 and loongarch64 systems that
> might end up using the "#define __BITS_PER_LONG 32" default from the old
> tools headers. Backporting the commit into stable kernels would address
> this, but it would still break building kernels without that backport,
> and waste time for developers trying to understand the problem.
>
> arm64 build machines are rather common, and on riscv64 this can also
> happen in practice, but loongarch64 is probably new enough to not
> be used much for building old kernels, so only revert the bits
> for arm64 and riscv.
>
> Link: https://lore.kernel.org/all/20230731160402.GB1823389@dev-arch.thelio-3990X/
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Fixes: 8386f58f8deda ("asm-generic: Unify uapi bitsperlong.h for arm64, riscv and loongarch")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/include/uapi/asm/bitsperlong.h     | 24 +++++++++++++++++++
>  arch/riscv/include/uapi/asm/bitsperlong.h     | 14 +++++++++++
>  .../arch/arm64/include/uapi/asm/bitsperlong.h | 24 +++++++++++++++++++
>  .../arch/riscv/include/uapi/asm/bitsperlong.h | 14 +++++++++++

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

>  4 files changed, 76 insertions(+)
>  create mode 100644 arch/arm64/include/uapi/asm/bitsperlong.h
>  create mode 100644 arch/riscv/include/uapi/asm/bitsperlong.h
>  create mode 100644 tools/arch/arm64/include/uapi/asm/bitsperlong.h
>  create mode 100644 tools/arch/riscv/include/uapi/asm/bitsperlong.h
>
> diff --git a/arch/arm64/include/uapi/asm/bitsperlong.h b/arch/arm64/include/uapi/asm/bitsperlong.h
> new file mode 100644
> index 0000000000000..485d60bee26ca
> --- /dev/null
> +++ b/arch/arm64/include/uapi/asm/bitsperlong.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (C) 2012 ARM Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +#ifndef __ASM_BITSPERLONG_H
> +#define __ASM_BITSPERLONG_H
> +
> +#define __BITS_PER_LONG 64
> +
> +#include <asm-generic/bitsperlong.h>
> +
> +#endif	/* __ASM_BITSPERLONG_H */
> diff --git a/arch/riscv/include/uapi/asm/bitsperlong.h b/arch/riscv/include/uapi/asm/bitsperlong.h
> new file mode 100644
> index 0000000000000..7d0b32e3b7017
> --- /dev/null
> +++ b/arch/riscv/include/uapi/asm/bitsperlong.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +/*
> + * Copyright (C) 2012 ARM Ltd.
> + * Copyright (C) 2015 Regents of the University of California
> + */
> +
> +#ifndef _UAPI_ASM_RISCV_BITSPERLONG_H
> +#define _UAPI_ASM_RISCV_BITSPERLONG_H
> +
> +#define __BITS_PER_LONG (__SIZEOF_POINTER__ * 8)
> +
> +#include <asm-generic/bitsperlong.h>
> +
> +#endif /* _UAPI_ASM_RISCV_BITSPERLONG_H */
> diff --git a/tools/arch/arm64/include/uapi/asm/bitsperlong.h b/tools/arch/arm64/include/uapi/asm/bitsperlong.h
> new file mode 100644
> index 0000000000000..485d60bee26ca
> --- /dev/null
> +++ b/tools/arch/arm64/include/uapi/asm/bitsperlong.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (C) 2012 ARM Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +#ifndef __ASM_BITSPERLONG_H
> +#define __ASM_BITSPERLONG_H
> +
> +#define __BITS_PER_LONG 64
> +
> +#include <asm-generic/bitsperlong.h>
> +
> +#endif	/* __ASM_BITSPERLONG_H */
> diff --git a/tools/arch/riscv/include/uapi/asm/bitsperlong.h b/tools/arch/riscv/include/uapi/asm/bitsperlong.h
> new file mode 100644
> index 0000000000000..0b9b58b57ff6e
> --- /dev/null
> +++ b/tools/arch/riscv/include/uapi/asm/bitsperlong.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2012 ARM Ltd.
> + * Copyright (C) 2015 Regents of the University of California
> + */
> +
> +#ifndef _UAPI_ASM_RISCV_BITSPERLONG_H
> +#define _UAPI_ASM_RISCV_BITSPERLONG_H
> +
> +#define __BITS_PER_LONG (__SIZEOF_POINTER__ * 8)
> +
> +#include <asm-generic/bitsperlong.h>
> +
> +#endif /* _UAPI_ASM_RISCV_BITSPERLONG_H */
