Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0301E44102E;
	Wed, 23 Sep 2026 06:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144198; cv=none; b=NQcw6QqDKR2GPGgFUMHV13huysBqYIBU8ElNW6l4ylYSwU+xZCoXydGrNjrYhKyRrIyNQ7sVtaXbMjXK9FT5Dsqrf4XyIZcRIiS0UFcNHKErGPQrSy/+bL59jutvx2Vp6wEVf7ccA9va8/RzvVLUo79VYeqtRVztIfe6o89Mluk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144198; c=relaxed/simple;
	bh=cxPrCgnSnZx5lbBIBCrN1f05i0JT6ESXKVBfq3xOWDI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iPL9z1vywwquGtnT9sHvG4b+QbJr+9/LeiHOJk8UIxzrC3y0mOAxITe0wipF+i/13pz8RkwUWmSwAe0S/LSDoGyWArbjZVJdz92P+L65CgpD1PhodFz9lnwiunz1IENyL4MLKnXECl7UD2s2CuhXwmlypC89S4JiEhW/PBaORFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bkkWlJqN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bkkWlJqN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3AF1F000FF;
	Wed, 23 Sep 2026 06:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790144196;
	bh=JNle6DdVpbG/BswqBxBR4WImK7gnKgjNKRAaR3X4LHs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bkkWlJqNt/TkISo3l26HvKwQ1jDjP94mE2t9ahqoZjDLnN8nLUDcuzlFS0z3rFs4w
	 QJ0sUWd48WTlKN8i+ioSqilAeFcQkraeCxGLtUnQh12TA2Riz8KPdj4qC9vaDa1Aux
	 OSd47QMlu2zLmX7Syn0tpPHfJ2/Hpu0dPZPR9UznbM6BK1EwJG/sbMsbC5qoy7D3dl
	 mNeInmf6v9iLpdK/oYgpJ9if8TUI88Z3vi7tDwzB4n+p4YwgxvLblWUVTZXqSPfcwd
	 5Wn4pSMg0Hrv7rYun/A9hE4x/qdj44YvLS6PsqYKBqp5deWaZ7IG8QIUD+1mT2MOsX
	 3baRIEamqo1AA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] LoongArch: kdump: add arch_crash_save_vmcoreinfo()
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mike Rapoport" <rppt@kernel.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Huacai
 Chen" <chenhuacai@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Yangyang
 Lian" <lianyangyang@kylinos.cn>, "Andrew Morton" <akpm@linux-foundation.org>, "Baoquan
 He" <baoquan.he@linux.dev>
Cc: "Haoran Jiang" <jianghaoran@kylinos.cn>, loongarch@lists.linux.dev, "WANG
 Xuerui" <kernel@xen0n.name>, "George Guo" <guodongtai@kylinos.cn>, "Dave
 Young" <ruirui.yang@linux.dev>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260923060349.146780-1-lianyangyang@kylinos.cn>
References: <20260923060349.146780-1-lianyangyang@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 06:16:35 +0000
Message-Id: <20260923061635.8E3AF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] kdump: off-by-one in VMEMMAP_END export causes incorrect range i=
n tools
--

commit 39488158a1b2af61bc47f6be1cf24b8ef1c6d7cd
Author: Yangyang Lian <lianyangyang@kylinos.cn>

LoongArch: kdump: add arch_crash_save_vmcoreinfo() support
   =20
This commit implements arch_crash_save_vmcoreinfo() for LoongArch to export
architecture-specific values to the vmcoreinfo PT_NOTE. This allows userspa=
ce
crash analysis tools to reliably derive module ranges, vmemmap ranges, VA_B=
ITS,
and the KASLR offset.

> diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentati=
on/admin-guide/kdump/vmcoreinfo.rst
> index 404a15f6782c3..a714ce4cf2141 100644
> --- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
> +++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst

[ ... ]

> +MODULES_VADDR|MODULES_END|VMALLOC_START|VMALLOC_END|VMEMMAP_START|VMEMMA=
P_END
> +------------------------------------------------------------------------=
-----
> +
> +Used to get the correct ranges:
> +	MODULES_VADDR ~ MODULES_END-1 : Kernel module space.
> +	VMALLOC_START ~ VMALLOC_END-1 : vmalloc() / ioremap() space.
> +	VMEMMAP_START ~ VMEMMAP_END-1 : vmemmap region, used for struct page ar=
ray.

[ ... ]

> diff --git a/arch/loongarch/kernel/vmcore_info.c b/arch/loongarch/kernel/=
vmcore_info.c
> new file mode 100644
> index 0000000000000..1128f6cdfe0dd
> --- /dev/null
> +++ b/arch/loongarch/kernel/vmcore_info.c

[ ... ]

> +void arch_crash_save_vmcoreinfo(void)
> +{
> +	VMCOREINFO_NUMBER(VA_BITS);
> +	/* NUMBER(VMALLOC_START) is exported by the generic code */
> +	vmcoreinfo_append_str("NUMBER(VMALLOC_END)=3D0x%lx\n", VMALLOC_END);
> +#ifdef CONFIG_64BIT
> +	vmcoreinfo_append_str("NUMBER(MODULES_VADDR)=3D0x%lx\n", MODULES_VADDR);
> +	vmcoreinfo_append_str("NUMBER(MODULES_END)=3D0x%lx\n", MODULES_END);
> +	vmcoreinfo_append_str("NUMBER(VMEMMAP_START)=3D0x%lx\n", (unsigned long=
)vmemmap);
> +	vmcoreinfo_append_str("NUMBER(VMEMMAP_END)=3D0x%lx\n", VMEMMAP_END);

[Severity: Medium]
Is this exporting the correct boundary for VMEMMAP_END?

As documented in the newly added admin-guide for vmcoreinfo (above), tools
like crash or makedumpfile expect the exported VMEMMAP_END to act as an
exclusive bound (VMEMMAP_START ~ VMEMMAP_END-1).

However, on LoongArch, the VMEMMAP_END macro is defined as an inclusive bou=
nd.
Exporting it directly without adjusting it to an exclusive bound
(e.g., VMEMMAP_END + 1) means the exported value is off by one byte.=20

Could this cause tools calculating the size via VMEMMAP_END - VMEMMAP_START
to get VMEMMAP_SIZE - 1, thereby truncating the last page when shifted and
triggering errors when analyzing the vmcore?

> +#endif
> +	vmcoreinfo_append_str("NUMBER(PHYS_OFFSET)=3D0x%lx\n", PHYS_OFFSET);
> +	vmcoreinfo_append_str("KERNELOFFSET=3D%lx\n", kaslr_offset());
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923060349.1467=
80-1-lianyangyang@kylinos.cn?part=3D1
