Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089920;
	b=zZj63wlpb0E3jqjwcydcMyepvTLWcLocVsU9jL/AiSFfqdozz+kWFD+dRekPQcOhS1mn
	 eme4YMOT/c/+PcGnk5/972mIdytAlpxf7cBnDRB9fk7bCdM9KHWJW9t2E7XjXbkzm4doC
	 YfJrfcRoT/J8Gv95MBHX7a6u0naDw5hJKGQsTI8jTOX/tt4qrwSx8YCED4aDvBFo+tX4/
	 IxIO7DMircpwTfp78Biv4A8km8AZe/puUsw0BYFohfJ6g0QL88jo9evX0ahZmEz9K+SbO
	 epFVOe/+FbDa3FGaAb/X+K/1LT0wTx29OxHJJ0MOI2TzNTpMC+SVVfDO6Pv6pV80Pvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089920;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FBxJcPXeAm8QKAUiFswz58ZNqPTA/e/PJf+hWh7nZOk=;
	b=EUetnuo5+qjGcm/HkZZtH9qHRvfi/7PbkYH8jHDEhcfH+2s1/yzNuKP1JhPNhmTROazP
	 Rht3tw5ntQmbrNWPXS0bYB9jAcl8EnDrNsIMPbtyUr03LcLyCED1P+76WSlxsUkRc3gLj
	 YGmzyjgOS4ixmxcJGh8QoA9o9E3rzd2lYBnvSyIxEjaPxqQzJrBE03NmZxiRQsaxIw71G
	 koMQklfXXP7q5nvJmD0WciRZNbgq3+J+wcGO/H0pkzKQCm7qkMk0ye2UfYHdMwsAq7Db9
	 iTlT8wCTY3taCHOo8N+fVL6589E9WlhC+2/dqW4suiolJVyljflI+BRw68c97LjGtkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F19LKSe7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6BE606A325
	for <loongarch@lists.linux.dev>; Thu, 19 Nov 2026 12:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F19LKSe7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E49E1F000C7
	for <loongarch@lists.linux.dev>; Thu, 19 Nov 2026 12:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795089920;
	bh=FBxJcPXeAm8QKAUiFswz58ZNqPTA/e/PJf+hWh7nZOk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F19LKSe7uDen+UvWYVGeYYdk9oWw0ri9Y5JIS3d16mhgInPtDp0AyEAPEY0AK/AJA
	 AWBSc0NV1eTlvSs2pabj0ptMpNlbCbQFGTo+bzKE+2Z/wTM09vqSwxUF624zvojg86
	 EE+98soll+0f2PeedrC8zb0l867y9yYGNOgRjexyc+1YqR32fk0DDkLFsqwv8tRKr6
	 KEE8YMnYIdneUSySln43y+p+2irxKQ/JgWo8FKZhtuQyzKHVa6TrxEQX/hckIl/btV
	 A3bUjmy9zwA8+VgRGdOwjPQnu/hlCuA8gGwOLVmEM+K9r6r2AVkKrjpGacHWgi/wpn
	 tChIou+xt4Fbw==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso3320289a12.3
        for <loongarch@lists.linux.dev>; Thu, 19 Nov 2026 04:05:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFhYCapYcRSV3vZxm6SvhZeUbByEvCuCZ0uT2ZfS15DaUgwmhifgNheYtWiL6KJhhtCTAeihLN6QzA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9tr+VOu4Y4kNFJnJthHTgunupvNhf7D1cQCDNg8OqudObg1wZE
	bUDBH5+gwBTqFAC6VHYSFsF+kGvftPpdyqhfwAwllRD6fYTHj33rDFWJzc9hylDZ4quAsR/PTMV
	J/+wQL27WPUFwWBHxO90oH7Wv2CRN3bs=
X-Received: by 2002:a05:6402:1ed4:b0:6b5:5530:c9af with SMTP id
 4fb4d7f45d1cf-6b887e83a81mr4871588a12.15.1795089919238; Thu, 19 Nov 2026
 04:05:19 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119100216.10182-1-dongtai.guo@linux.dev>
In-Reply-To: <20261119100216.10182-1-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 19 Nov 2026 20:05:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4pmcV8hah8sPyQn3nR9cO-NwkXMPLeSABAO-VEnS08fg@mail.gmail.com>
X-Gm-Features: AclHuK_cEZcZkwIHDpc5O50alIIDUZZaaZh_szL239OmmvVzzDhSkIejCjgHXmg
Message-ID: <CAAhV-H4pmcV8hah8sPyQn3nR9cO-NwkXMPLeSABAO-VEnS08fg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Allow memblock arrays to resize
To: George Guo <dongtai.guo@linux.dev>
Cc: kernel@xen0n.name, rppt@kernel.org, liukexin@kylinos.cn, 
	guodongtai@kylinos.cn, loongarch@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, George,

On Thu, Nov 19, 2026 at 6:02=E2=80=AFPM George Guo <dongtai.guo@linux.dev> =
wrote:
>
> From: George Guo <guodongtai@kylinos.cn>
>
> LoongArch never calls memblock_allow_resize(), so the memblock region
> arrays cannot grow beyond their static sizes. For the reserved array
> that is INIT_MEMBLOCK_RESERVED_REGIONS (INIT_MEMBLOCK_REGIONS +
> NR_CPUS) entries. Once it is full, the next reservation that needs a
> new region panics:
>
>   Kernel panic - not syncing: memblock: cannot resize reserved array
>
> The memory setup code was derived from MIPS, which never enables
> resizing either. Nothing on LoongArch needs the arrays to stay static.
>
> When an array is full, memblock allocates a bigger one from free
> memory, so resizing is only safe once all memory in use is reserved.
> By the time setup_arch() calls arch_mem_init(), the kernel image, the
> initrd, the firmware memory map, the device tree reserved-memory
> regions and the crash kernel are reserved, so enable resizing there.
>
> Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
> This was patch 5/8 of the LoongArch KHO series v6 [1]. Mike suggested
> fixing it independently of KHO, and Huacai preferred arch_mem_init()
> to platform_init() [1].
>
> KHO for LoongArch needs this: after kexec, kho_memory_init() reserves
> every preserved range, and luo_stress_files with 500 files overflows
> the reserved array without CONFIG_SMP. A bigger array cannot land on
> preserved memory, because KHO limits memblock allocations to its
> bootmem areas by then.
>
> Changes since v6 5/8:
> - Sent on its own, without the KHO series.
> - Reworded the commit message and the comment so they do not depend
>   on KHO.
>
> [1] https://lore.kernel.org/all/20261029172956.20791-6-dongtai.guo@linux.=
dev/
>
>  arch/loongarch/kernel/setup.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.=
c
> index 6fa4a22a58fd..8c33346a123a 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c
> @@ -402,6 +402,9 @@ static void __init arch_mem_init(char **cmdline_p)
>
>         check_kernel_sections_mem();
>
> +       /* All memory in use is reserved now, so memblock can grow its ar=
rays. */
> +       memblock_allow_resize();
Would you mind if I move it between memblock_dump_all() and
memblock_set_bottom_up(false)?

Huacai

> +
>         memblock_set_bottom_up(true);
>
>         swiotlb_init(true, SWIOTLB_VERBOSE);
>
> base-commit: 422e532809572ba1043192bf6a0c653bc68b3140
> --
> 2.53.0
>
