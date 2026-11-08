Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794114300;
	b=ljrvLqq7brOx9KyKz2psp8Jbo/OgaroL4GGrJ5k1+VMqHIktY0YLhEeOdaSqwIPA6GLx
	 l7sJycnj3Rkb3qlNj26bvFazQ0BgmFiVWUW9LWL2+8Ep4R8USpZ1FTBKR+hEnd3Cawj0s
	 Cm2g3ePQOphrKh4RpIjDtXZc7oFJSgB9AdihF3nqFezTu3GjSx4vxdBMecsQMbglb08O3
	 L6lRC6CyBwLuiTBYg4fR//GekufSoW8ZKptG+zSCkTR/i/3l8ZXMRrqx6ykhIsDiDRaRu
	 4qdR/p4SRc5VrNOTUURitkBMiUxp2Xc9bDJZb+tRpZd4mom+agnYCfMnKY/KZHTzp7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794114300;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sF/uWwUMdyQTFEohDQoXXPJBga/lDBbiNP68HoOZfE0=;
	b=VpPlM5Wm+8I3NTmm4MVeM7RR9l2oldEF7ZBHFbltQTmG77fP61SHpQBMgALIYkQFeF3m
	 y+0GdsTtQM0wSs+89lHR7bAWrpDGw6JTVz/82oTBzusAKxdINPM567Dy16AhuPycn3ilp
	 CRxwg/Eqi2NLq+zYNSKAu2rpce6E9C6vBP2M+Cf9+M6TzCEk9XYfAdr1Nh5nDwR8nFep9
	 he+uq6mgt3Neug7t4ZBSfNlM2XsEulMt71mA2k3IyrNbE3kRXgHhFZeg7BBVIpVs9GaE6
	 F7yWd0c8F/Mi1g54i1OaR/z8iybhK16rSt9EstzzoBai24uv2CQkGR0sQRY1/7VO6Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oc0FtpRa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ED6606A31C
	for <loongarch@lists.linux.dev>; Sun,  8 Nov 2026 05:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oc0FtpRa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F371F008A7
	for <loongarch@lists.linux.dev>; Sun,  8 Nov 2026 05:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794114299;
	bh=sF/uWwUMdyQTFEohDQoXXPJBga/lDBbiNP68HoOZfE0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Oc0FtpRaL71QxDdKOoPKR0aFT1fSqeGOZ4MV0eClmQAR7zhYXaxkfBfo49cTbqLto
	 BxuYax2chajgffMgWSc0+cDJEEUrxougLWwXTV2h+p1iEChWwr9zwIvqVfmclhGsTU
	 xD+h5Gob5iel+ZywIAd9SSTHSU73Z7qh1rJq8oMpErz5VrXVOjGXZ6new9R7tjNrAg
	 QxTR7AeTNkwKKSdkDlZjHObcZYY+7kTnGb9jUFAcbxrMGuG3xH1vgbFMfhhKncS9ya
	 J6OYAyYJuD3vtBbJ8TS6onCXNlNOEJflVsEf0USyxXnjMvXVU1qT1xsKEQDtfT/2De
	 4Jo/WmSTMwKLA==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b70d5b07faso134940a12.0
        for <loongarch@lists.linux.dev>; Sat, 07 Nov 2026 21:04:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH15DCgtWAVdacQH3Oq46tV6nZN5xcDvb0gvY9VQWVKuawE3zoktWpBjPG8NnC1s+eI1r406P4idfg=@lists.linux.dev
X-Gm-Message-State: APuU4Z96JyZgfYpnS6MShhLyvlRGIxpSTnmonbHDJOvZw7kSljibpaKv
	9U5INv4IVHfTrRZ3ZheYGkxiWM7Dcmr+w3178PU0VoIAUv2yg63TSkbRPoe74yCqnqiFDCZPsHA
	NmnqdGjfmYsN4a85XFxWhxP1Vey2NSE4=
X-Received: by 2002:a05:6402:1f87:b0:6b5:6116:e333 with SMTP id
 4fb4d7f45d1cf-6b722445a2cmr336070a12.31.1794114298247; Sat, 07 Nov 2026
 21:04:58 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105130113.2284690-1-ruanjinjie@huawei.com>
In-Reply-To: <20261105130113.2284690-1-ruanjinjie@huawei.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 8 Nov 2026 13:04:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7iV7513zbP6RmRq=6mASsQv81YhU1Edo+XZLM=5R_eSg@mail.gmail.com>
X-Gm-Features: AclHuK-pPApRRbvMdL1FhrPBekwu-9j8xY64mjK5oe9qUw8iUSiTqNJzSJ2VoiQ
Message-ID: <CAAhV-H7iV7513zbP6RmRq=6mASsQv81YhU1Edo+XZLM=5R_eSg@mail.gmail.com>
Subject: Re: [PATCH v8] LoongArch: kexec_file: Fix a modified_cmdline leak
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: kernel@xen0n.name, guodongtai@kylinos.cn, liukexin@kylinos.cn, 
	zhangtianyang@loongson.cn, maqianga@uniontech.com, tangyouling@kylinos.cn, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Thu, Nov 5, 2026 at 9:01=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.com> =
wrote:
>
> machine_kexec_prepare() copies it to KEXEC_CMDLINE_ADDR
> and overwrites the pointer.
>
> Free the heap buffer after the copy.
>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: Kexin Liu <liukexin@kylinos.cn>
> Cc: Youling Tang <tangyouling@kylinos.cn>
> Cc: Qiang Ma <maqianga@uniontech.com>
> Cc: Tianyang Zhang <zhangtianyang@loongson.cn>
> Cc: George Guo <guodongtai@kylinos.cn>
> Cc: stable@vger.kernel.org
> Fixes: d162feec6b6e ("LoongArch: Add preparatory infrastructure for kexec=
_file")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v7 -> v8:
> - Split out from the patch set as Mike suggested.
> - Link to v7: https://lore.kernel.org/all/20261026075201.699550-1-ruanjin=
jie@huawei.com/
> ---
>  arch/loongarch/kernel/machine_kexec.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/loongarch/kernel/machine_kexec.c b/arch/loongarch/kerne=
l/machine_kexec.c
> index 1883cae93bc3..19ccc91b6f2a 100644
> --- a/arch/loongarch/kernel/machine_kexec.c
> +++ b/arch/loongarch/kernel/machine_kexec.c
> @@ -14,6 +14,7 @@
>  #include <linux/mm.h>
>  #include <linux/of_fdt.h>
>  #include <linux/reboot.h>
> +#include <linux/slab.h>
>  #include <linux/sched.h>
>  #include <linux/sched/task_stack.h>
>
> @@ -56,6 +57,7 @@ int machine_kexec_prepare(struct kimage *kimage)
>                  */
>                 memcpy((void *)KEXEC_CMDLINE_ADDR, (void *)kimage->arch.c=
mdline_ptr,
>                                         strlen((char *)kimage->arch.cmdli=
ne_ptr) + 1);
> +               kfree((void *)kimage->arch.cmdline_ptr);
>                 kimage->arch.cmdline_ptr =3D (unsigned long)KEXEC_CMDLINE=
_ADDR;
>         } else {
>                 /* Find the command line */
> --
> 2.34.1
>
>
