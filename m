Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2E02AF1D
	for <loongarch@lists.linux.dev>; Mon, 30 Mar 2026 03:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774842589; cv=none; b=YyBAXL9BNO4zQ2UzPAusityDvUd2J+Uof9IVAC6IJl78ogTIqGPb0+InZOcmNFSEm8j554RBxqIw5DUG1yFfpXJN70eVWZllV2Wfr6zWiPD32aLd8ZU+9Nz11b6zBCkN/wOq3VKCsCBNTyQgegTf55XNld9eIXxKEMb9hRIFnGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774842589; c=relaxed/simple;
	bh=obCDFOyxCbjX0f8M408do6wNaHwmsZQneN83knIeC68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N9wom0Z7mIrC+RH6/h8vdcCWX7R8P3y8BWD9sI6nFMJrS/Q2jug915eP8UfBDg6Sag3gUhUmu5RGZIjtUNJrPVRLqnWZOrP9VqueJrwMiwebCqXTHBsvs2lLxHVsBWpMP2KKR+JiDBpLFbSsUZPrHbdEjvoY/5CbpvQAZzvAYjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eoZ8B/st; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eoZ8B/st"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361A5C2BCB9
	for <loongarch@lists.linux.dev>; Mon, 30 Mar 2026 03:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774842589;
	bh=obCDFOyxCbjX0f8M408do6wNaHwmsZQneN83knIeC68=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eoZ8B/stmhNenV55/GZwaY1J2F6+Mdl80yqD9NRcEWBOsoYl+9c7bLnMbhuDm8UCy
	 /HdFRjzUQbmAk/UyPSD+aNwyk+7+AXRsactruboxv4TBhmx7ZVUw3PnXCFXHbt/2Tv
	 8gPyg7oqfxDRPwPwOxonENTYb7rY2pfqtB3H6lN+8wTRbtHFo5byuP+ppf4WRnAd5Y
	 XciAnSMYuc3D6bWIB/pXvfsgHa26rnCnF4gtv6axbQIdyVpVlSoEdBsZ3ZtXIwQJfW
	 magEl9/ciAmyJ46LOqRQucXon3Rz5vlKU6TS+JdRCMl0FTU+kXQTbAQM34dEaStji4
	 KbhEz4mM9Fraw==
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so402575f8f.0
        for <loongarch@lists.linux.dev>; Sun, 29 Mar 2026 20:49:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWD/7OqHZLY7caDC1NgzA1rQ3T5boI6KRBaFnu3MLuRALfMwPpD6Uu3Ch0y5cfCg/lLR7DIq84sXA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOZDD6XFLfWA9fO5j7E3d8oMOvVT2NlvHMPW5dSaV7napwa0Wm
	TC3O1qblWHunlIv1mw2c/E/OgjV3KlQ75UnZuliBQylqU/TpXREn88TqMI/YJoFXVpdrzLuN4Li
	XLKLF9GwWjSAs2kjkqruwt+RliEFpvWY=
X-Received: by 2002:a05:6000:250f:b0:43c:f4df:923c with SMTP id
 ffacd0b85a97d-43cf4dfaca4mr10913170f8f.49.1774842587366; Sun, 29 Mar 2026
 20:49:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260328074013.3589544-1-ruanjinjie@huawei.com> <20260328074013.3589544-2-ruanjinjie@huawei.com>
In-Reply-To: <20260328074013.3589544-2-ruanjinjie@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 30 Mar 2026 11:49:33 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRN=RpgzQsQ7QDbwjDmyQZP9anQZ+CaK2r-Mrz9dQbohQ@mail.gmail.com>
X-Gm-Features: AQROBzDiH9EGqvtsmkvuTI8F_a_MxhnUfiDn46oBgBr7JyKcMW8nH_9Y5zS6MkE
Message-ID: <CAJF2gTRN=RpgzQsQ7QDbwjDmyQZP9anQZ+CaK2r-Mrz9dQbohQ@mail.gmail.com>
Subject: Re: [PATCH v11 01/11] riscv: kexec_file: Fix crashk_low_res not
 exclude bug
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org, 
	saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com, 
	vgoyal@redhat.com, dyoung@redhat.com, rdunlap@infradead.org, 
	peterz@infradead.org, feng.tang@linux.alibaba.com, 
	pawan.kumar.gupta@linux.intel.com, dapeng1.mi@linux.intel.com, 
	kees@kernel.org, elver@google.com, paulmck@kernel.org, lirongqing@baidu.com, 
	rppt@kernel.org, leitao@debian.org, ardb@kernel.org, cfsworks@gmail.com, 
	osandov@fb.com, jbohac@suse.cz, tangyouling@kylinos.cn, 
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com, eajames@linux.ibm.com, 
	songshuaishuai@tinylab.org, kevin.brodsky@arm.com, vishal.moola@gmail.com, 
	junhui.liu@pigmoral.tech, coxu@redhat.com, fuqiang.wang@easystack.cn, 
	liaoyuanhong@vivo.com, chenjiahao16@huawei.com, hbathini@linux.ibm.com, 
	takahiro.akashi@linaro.org, james.morse@arm.com, lizhengyu3@huawei.com, 
	x86@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 28, 2026 at 3:41=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:
>
> As done in commit 944a45abfabc ("arm64: kdump: Reimplement crashkernel=3D=
X")
> and commit 4831be702b95 ("arm64/kexec: Fix missing extra range for
> crashkres_low.") for arm64, while implementing crashkernel=3DX,[high,low]=
,
> riscv should have excluded the "crashk_low_res" reserved ranges from
> the crash kernel memory to prevent them from being exported through
> /proc/vmcore, and the exclusion would need an extra crash_mem range.
>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Baoquan He <bhe@redhat.com>
> Fixes: 5882e5acf18d ("riscv: kdump: Implement crashkernel=3DX,[high,low]"=
)
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/riscv/kernel/machine_kexec_file.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/m=
achine_kexec_file.c
> index 54e2d9552e93..3f7766057cac 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c
> @@ -61,7 +61,7 @@ static int prepare_elf_headers(void **addr, unsigned lo=
ng *sz)
>         unsigned int nr_ranges;
>         int ret;
>
> -       nr_ranges =3D 1; /* For exclusion of crashkernel region */
> +       nr_ranges =3D 2; /* For exclusion of crashkernel region */
>         walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback=
);
>
>         cmem =3D kmalloc_flex(*cmem, ranges, nr_ranges);
> @@ -76,8 +76,16 @@ static int prepare_elf_headers(void **addr, unsigned l=
ong *sz)
>
>         /* Exclude crashkernel region */
>         ret =3D crash_exclude_mem_range(cmem, crashk_res.start, crashk_re=
s.end);
> -       if (!ret)
> -               ret =3D crash_prepare_elf64_headers(cmem, true, addr, sz)=
;
> +       if (ret)
> +               goto out;
> +
> +       if (crashk_low_res.end) {
> +               ret =3D crash_exclude_mem_range(cmem, crashk_low_res.star=
t, crashk_low_res.end);
Exclude crashk_low_res is reasonable, but have you tested this?

> +               if (ret)
> +                       goto out;
> +       }
> +
> +       ret =3D crash_prepare_elf64_headers(cmem, true, addr, sz);
>
>  out:
>         kfree(cmem);
> --
> 2.34.1
>


--=20
Best Regards
 Guo Ren
