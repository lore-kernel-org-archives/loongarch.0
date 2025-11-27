Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D02331C58A
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 07:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764228976; cv=none; b=ZLCtaBpClliqzJZv1Bit4zneePJ4f7Ojjh5gtRbV/XzPQOXJ+z0J3XwbYGoqm8rjpe2mSY7zFFkURpd2VDYdNggysOBx+hDjtVhh1+TyN5H1tr/yxRD35TuRz2e3ZSvsH/hDBTjeOlZJkLhPjTWEPiaoqbS1WWZ80HVNKE2B8o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764228976; c=relaxed/simple;
	bh=UfVp8slXD0qIQepfflNoIG54xQyPjfVDas5nJ6AmfBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qMERX6/Qrh4yClKDlxU/QIAleB1SGJBO0plWTVE6kcSQUmKmGBlBJKwhwfjr0H6EIabPfpCJTfl5R/ttUvEUTVNQpD9L/ljnlUgn/MdCEHTcVttZRpzn1CKDr4mvTyUfwowYMAwUOu8w4UxbcaO0W3aG5PkuSA0PxJvESRFl+3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnUnktCb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnUnktCb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D468C113D0
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 07:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764228976;
	bh=UfVp8slXD0qIQepfflNoIG54xQyPjfVDas5nJ6AmfBo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lnUnktCbTme4ehvGBzn6HFDgPX6FcR36cT2B2bwMWwVKhyiSEoEw8WjJrLXqP10nG
	 Rs/WdWEw0m97199SGb79V+JkUnXWMcQrGtO7vQeCUnHPhfKfC4R4siFBvtrbhA9YmS
	 48p6EJHtrL2t3OOyKPVggRg1n99mEdxm4bDUj1EDyjdr7fkMLCH8G61ARm2kmxFzH0
	 PrafMcPx4LaDj4QTDTIlX8WqQZ0lJ2H8t6JRDkoTnXKp3qXev0MUFRxYUhUu6Zf2IT
	 HE7ezkOBkVfbKpKA3Uglo0kO1dIUtPzgebe11yy1AG8g9UNCOGUItdmLrBQVMYG9dc
	 5pd91PnGSmG6g==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b713c7096f9so88794066b.3
        for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 23:36:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGvTZAfyeqk2Lp05QhIk4ojvB6a8Yxnq5qwmDy6fvIEc9N0rFJvH8JnxK/ZkZG9W2go9PfsKQmHpE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBKYW0h0Q4wav4CE6v1UNDE6NbOh0i6ryIpOa6hwqjP5JOEVKU
	GDlkoczZIlfOwU35QOMAlD2qWpTX1/dC/xZmqKuq8nJtbQXrPF5TmPpCvQDQlCRUf61kLbf36mm
	p7UuP4Srp38JgF7v8jRVvEUvefMRekTU=
X-Google-Smtp-Source: AGHT+IEW1IvlL9wpj8b2D3D/j3st8sJ9+YHtknvYWILrKD1R6IDSZnYCBQVxuWeranQwGzQQ/APaVcwa+lN024/tig4=
X-Received: by 2002:a17:906:378f:b0:b76:ece6:2ca1 with SMTP id
 a640c23a62f3a-b76ece62ce9mr207468266b.57.1764228974567; Wed, 26 Nov 2025
 23:36:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251127033123.3445519-1-maqianga@uniontech.com>
In-Reply-To: <20251127033123.3445519-1-maqianga@uniontech.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 27 Nov 2025 15:36:20 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6vmQpBhf5qiBg9C1SMSOy3O5hd6RnPc1B0Yg3r3+exSA@mail.gmail.com>
X-Gm-Features: AWmQ_bl1hw_KfQDt31GvZzNallTYDEqQiCRZAzbWhaIeKz_VVXwKzm2NGB-6-7M
Message-ID: <CAAhV-H6vmQpBhf5qiBg9C1SMSOy3O5hd6RnPc1B0Yg3r3+exSA@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: Correct the calculation logic of thread_count
To: Qiang Ma <maqianga@uniontech.com>
Cc: kernel@xen0n.name, hengqi.chen@gmail.com, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Qiang,

On Thu, Nov 27, 2025 at 11:32=E2=80=AFAM Qiang Ma <maqianga@uniontech.com> =
wrote:
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
>  arch/loongarch/kernel/setup.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.=
c
> index 25a87378e48e..8dd25fc4bd13 100644
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
> @@ -120,13 +121,19 @@ static void __init parse_cpu_table(const struct dmi=
_header *dm)
>  {
>         long freq_temp =3D 0;
>         char *dmi_data =3D (char *)dm;
> +       u8 thread_count;
>
>         freq_temp =3D ((*(dmi_data + SMBIOS_FREQHIGH_OFFSET) << 8) +
>                         ((*(dmi_data + SMBIOS_FREQLOW_OFFSET)) & SMBIOS_F=
REQLOW_MASK));
>         cpu_clock_freq =3D freq_temp * 1000000;
>
>         loongson_sysconf.cpuname =3D (void *)dmi_string_parse(dm, dmi_dat=
a[16]);
> -       loongson_sysconf.cores_per_package =3D *(dmi_data + SMBIOS_THREAD=
_PACKAGE_OFFSET);
> +       thread_count =3D *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
> +       if (thread_count !=3D 0)
> +               loongson_sysconf.cores_per_package =3D
> +                               dm->length >=3D 0x30 && thread_count =3D=
=3D 0xFF ?
> +                               *(u16 *)(dmi_data + SMBIOS_THREAD_PACKAGE=
_2_OFFSET) :
> +                               thread_count;
According SPEC, it uses THREAD_COUNT_2 only if dm->length >=3D 30 and
thread_count =3D=3D 0xff, so the correct and simplest way is like this:

        cpu_clock_freq =3D freq_temp * 1000000;

        loongson_sysconf.cpuname =3D (void *)dmi_string_parse(dm, dmi_data[=
16]);
-       loongson_sysconf.cores_per_package =3D *(dmi_data +
SMBIOS_THREAD_PACKAGE_OFFSET);
+       if (dm->length < 0x30)
+               thread_count =3D *(u8 *)(dmi_data + SMBIOS_THREAD_PACKAGE_O=
FFSET);
+       else if (thread_count =3D=3D 0xff)
+               thread_count =3D *(u16 *)(dmi_data +
SMBIOS_THREAD_PACKAGE_2_OFFSET);
+       loongson_sysconf.cores_per_package =3D thread_count;

        pr_info("CpuClock =3D %llu\n", cpu_clock_freq);

Huacai

>
>         pr_info("CpuClock =3D %llu\n", cpu_clock_freq);
>  }
> --
> 2.20.1
>
