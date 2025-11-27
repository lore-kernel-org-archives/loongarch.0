Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDD91A9F9D
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 12:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764245304; cv=none; b=l+7aSL/cAXvfYFxfCxrr2mBxsUSXmvGFY4hG/htqsfLfrO2NQNWxG5IQF+2buLIBgz6YDgqKLTTS3RK7IJbfFetzNk8mFb3iGHd5UlovaIefQGa3Brw9kqyvaotOIQwHkZ8N3oe22FJwBaMBwMWOol29UqaGsP0KMmK7//fxPQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764245304; c=relaxed/simple;
	bh=uD2RZN4VdknGWWj5uflx8LDr1xab0Vw4SipoOPpXAfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kROUppJq2LJa0kKC1mMxir1qZp/faLZdlAnfXIyeJ0FGd4qFvyD0UuXxymWFQwS7FDyrzLsDrW3J0iCflPpPfDl+idb1TPUHOk6SWOQ43DiFg0slJZ7k6mvnSWuqXppour2G0Y59wvw7LPS3VKRuRV+QwKgYtDrw43djZ2+eYVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXcJtAhL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VXcJtAhL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B1CC4CEFB
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 12:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764245303;
	bh=uD2RZN4VdknGWWj5uflx8LDr1xab0Vw4SipoOPpXAfI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VXcJtAhL/O0DZMv4vtSWIw/VpjhE7h+MkKxiPdnLWRKeIV3fsxUYYNJQNN+hwGCpN
	 NdRRarUG0Mxc+N7at0Xs4Og6hy2YQ9fvr1SLqOXVJ3qo10CTa/+dNU4Q4indFB6KYE
	 fGszZspVwPeFwtcqntpCAQ0vxHPMU1YXFvR+zOndBbbERgMrCcXsWsUUpeAThFT+Wo
	 kfNTvR6OuNexGg+z8sZaiwyl444gpwNPXNxV55iJMjB/zC0uWc44Q0Db9ucCkuiB/A
	 l2K9mDkGeVvz8WR6Oswok4jVkIDcm86l//RUrfZ9g0O95zkNtf1aTHJA7QyfIqrwnW
	 KzoXd/gY/y+ew==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7380f66a8bso126466466b.2
        for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 04:08:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVRNAAArdoOPQ5tXOYGi3I5QWjRkaKL/wtPnciihEUiXkxGFkP9WlCJgj/iuLjDFPwa5UuyQ2GyOyE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkIQrqXVUUIrmwxqtYjcUFTyM84zGiIGTLqVx0MPlK0ZC0Zz8a
	9qW2rtLIbNHt9AL5A9K4oS5B8TvK5SnPhW11hHGVhuMC5T7bGjpEQHa/z8e9NV+/LmNBd50c0WB
	e05LlLGHtblDTbt+nT/MU1z24aKxo3dc=
X-Google-Smtp-Source: AGHT+IG+r6fI8NF9L6YLqSp2Shso4lOBTZ0Z/12bLcC1HahjNCOC8UZmwFLoZQ6L1iUEe4Nqmb7j+9fX3WTRXBj2AEA=
X-Received: by 2002:a17:907:7205:b0:b40:8deb:9cbe with SMTP id
 a640c23a62f3a-b7671549ca8mr2627708766b.2.1764245302235; Thu, 27 Nov 2025
 04:08:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251127101946.3531069-1-maqianga@uniontech.com>
In-Reply-To: <20251127101946.3531069-1-maqianga@uniontech.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 27 Nov 2025 20:08:27 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6=1W9-WSmSVtnOzCNFDYV4=1fKR2pdNnAKOQ=5OXJT1A@mail.gmail.com>
X-Gm-Features: AWmQ_bkTIJQ04KgU96lSGTEPzW8c0NPr03lgcULYToXsj917tUwOT2dLrIW-RoM
Message-ID: <CAAhV-H6=1W9-WSmSVtnOzCNFDYV4=1fKR2pdNnAKOQ=5OXJT1A@mail.gmail.com>
Subject: Re: [PATCH v3] LoongArch: Correct the calculation logic of thread_count
To: Qiang Ma <maqianga@uniontech.com>
Cc: kernel@xen0n.name, hengqi.chen@gmail.com, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Thu, Nov 27, 2025 at 6:21=E2=80=AFPM Qiang Ma <maqianga@uniontech.com> w=
rote:
>
> For thread_count, the current calculation method has a maximum of 255,
> which may not be sufficient in the future. Therefore, we are correcting
> it now.
>
> Reference: SMBIOS Specification, 7.5 Processor Information (Type 4)[1]
>
> [1]: https://www.dmtf.org/sites/default/files/standards/documents/DSP0134=
_3.9.0.pdf
>
> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> ---
>  arch/loongarch/kernel/setup.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.=
c
> index 25a87378e48e..eb6e3ac27436 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c
> @@ -56,6 +56,7 @@
>  #define SMBIOS_FREQLOW_MASK            0xFF
>  #define SMBIOS_CORE_PACKAGE_OFFSET     0x23
>  #define SMBIOS_THREAD_PACKAGE_OFFSET   0x25
> +#define SMBIOS_THREAD_PACKAGE_2_OFFSET 0x2E
>  #define LOONGSON_EFI_ENABLE            (1 << 3)
>
>  unsigned long fw_arg0, fw_arg1, fw_arg2;
> @@ -126,7 +127,12 @@ static void __init parse_cpu_table(const struct dmi_=
header *dm)
>         cpu_clock_freq =3D freq_temp * 1000000;
>
>         loongson_sysconf.cpuname =3D (void *)dmi_string_parse(dm, dmi_dat=
a[16]);
> -       loongson_sysconf.cores_per_package =3D *(dmi_data + SMBIOS_THREAD=
_PACKAGE_OFFSET);
> +       loongson_sysconf.cores_per_package =3D *(u8 *)(dmi_data + SMBIOS_=
THREAD_PACKAGE_OFFSET);
> +       if (dm->length >=3D 0x30 && loongson_sysconf.cores_per_package =
=3D=3D 0xff) {
> +               /* SMBIOS 3.0+ has ThreadCount2 for more than 255 threads=
 */
> +               loongson_sysconf.cores_per_package =3D
> +                               *(u16 *)(dmi_data + SMBIOS_THREAD_PACKAGE=
_2_OFFSET);
> +       }
>
>         pr_info("CpuClock =3D %llu\n", cpu_clock_freq);
>  }
> --
> 2.20.1
>
