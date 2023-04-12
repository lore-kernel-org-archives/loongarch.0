Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB312F24
	for <loongarch@lists.linux.dev>; Wed, 12 Apr 2023 09:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1681290522; bh=pFCbhykmw7bNP0wz9hvfELkLjySh0vNS5D8ZUvESsPA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oUKmmJ9QLFR/S6QUZo7IILLVlrKF7SUX724BaCPp8zY8rXCgNuNGqsmKh9RhDT5vw
	 9gX99+m8EgXijk2DvlbS7Rh+DBZKVcoiB4vqDxC5eeBPFZHyyU31Pv/NJEMk21Wx07
	 Cek+zeJ8Cbaj/Ler7y1MGrfc9G/ScQ8CKpL6IyhI=
Received: from [100.100.33.167] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 8DCA06014E;
	Wed, 12 Apr 2023 17:08:42 +0800 (CST)
Message-ID: <d5f906aa-2fcd-90c0-09dc-df1d8f0cd643@xen0n.name>
Date: Wed, 12 Apr 2023 17:08:41 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] LoongArch: Use VALEN instead of hard code in comments
Content-Language: en-US
To: Enze Li <lienze@kylinos.cn>, chenhuacai@kernel.org
Cc: loongarch@lists.linux.dev, enze.li@gmx.com
References: <20230412025525.116668-1-lienze@kylinos.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20230412025525.116668-1-lienze@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/4/12 10:55, Enze Li wrote:
> Refer to the online documentation[1] for Loongson, use the accurate
> VALEN in comments to avoid misleading others.

Reworded some Chinglish for you:

Subject: LoongArch: Replace hard-coded values in comments with VALEN

According to LoongArch documentation [1], CSR.PGDL and CSR.PGDH are 
concerned with the VA's MSB which is VALEN-1 instead of always being 47. 
Fix comments to avoid misleading others.

> 
> [1] https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#page-global-directory-base-address-for-lower-half-address-space

Nit: add a colon after [1]. (i.e. "[1]: xxxxx")

> 
> Signed-off-by: Enze Li <lienze@kylinos.cn>
> ---
>   arch/loongarch/include/asm/loongarch.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
> index 65b7dcdea16d..a182a1579148 100644
> --- a/arch/loongarch/include/asm/loongarch.h
> +++ b/arch/loongarch/include/asm/loongarch.h
> @@ -423,9 +423,9 @@ static __always_inline void iocsr_write64(u64 val, u32 reg)
>   #define  CSR_ASID_ASID_WIDTH		10
>   #define  CSR_ASID_ASID			(_ULCAST_(0x3ff) << CSR_ASID_ASID_SHIFT)
>   
> -#define LOONGARCH_CSR_PGDL		0x19	/* Page table base address when VA[47] = 0 */
> +#define LOONGARCH_CSR_PGDL		0x19	/* Page table base address when VA[VALEN-1] = 0 */
>   
> -#define LOONGARCH_CSR_PGDH		0x1a	/* Page table base address when VA[47] = 1 */
> +#define LOONGARCH_CSR_PGDH		0x1a	/* Page table base address when VA[VALEN-1] = 1 */
>   
>   #define LOONGARCH_CSR_PGD		0x1b	/* Page table base */
>   
> 
> base-commit: fc89d7fb499b0162e081f434d45e8d1b47e82ece

Change itself is trivial enough, thanks!

With the nits addressed: (Huacai may apply the suggestion while applying 
to loongarch-next, so you won't have to resend v2)

Reviewed-by: WANG Xuerui <git@xen0n.name>

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

