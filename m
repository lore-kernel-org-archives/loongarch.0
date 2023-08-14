Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7C2C2FF
	for <loongarch@lists.linux.dev>; Mon, 14 Aug 2023 17:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9EBC433C7;
	Mon, 14 Aug 2023 17:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692034186;
	bh=YfYqRU0e4MMwMOj2+INPBwr2gWAZuRCkDC7CcbLJZwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HlorosbJfBKoKuSEzuhpMEDhyCEgNbAjh0WRUWYvSrJQqbpn3RtXV5MXfqg86XMZu
	 PRIzl/a1Zm4JP01aAyYvOo4eXjKSbKRGZrZWsBFgfzWmWosvRskjtSYJ2u1nkaIfYL
	 3mf/YLk5P4/kwIbW0/0OW/80eBACchzwcI47RwiFpmJ8Jtw1j/csY9iAstWbSpBBpy
	 WmteJ/YnEIbAWmaPz48U1VnmCu8ZYlvXIU9ZmGAGJDjbISnm/WF00EiP+i3H+Of/tV
	 S7GkK22qTItYf8xndl/FvrUeZPyDCen+y0gW4tx9jdOzDBO2nrwCoUYxtEv2uqlbq4
	 l2mipDbqBG9jA==
Date: Mon, 14 Aug 2023 10:29:43 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, loongarch@lists.linux.dev,
	WANG Xuerui <kernel@xen0n.name>,
	Huacai Chen <chenhuacai@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] asm-generic: partially revert "Unify uapi bitsperlong.h
 for arm64, riscv and loongarch"
Message-ID: <20230814172943.GB911700@dev-arch.thelio-3990X>
References: <20230811204930.1529925-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811204930.1529925-1-arnd@kernel.org>

On Fri, Aug 11, 2023 at 10:49:07PM +0200, Arnd Bergmann wrote:
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

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/arm64/include/uapi/asm/bitsperlong.h     | 24 +++++++++++++++++++
>  arch/riscv/include/uapi/asm/bitsperlong.h     | 14 +++++++++++
>  .../arch/arm64/include/uapi/asm/bitsperlong.h | 24 +++++++++++++++++++
>  .../arch/riscv/include/uapi/asm/bitsperlong.h | 14 +++++++++++
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
> -- 
> 2.39.2
> 
