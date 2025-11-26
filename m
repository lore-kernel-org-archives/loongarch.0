Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203523126AC
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 05:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764134850; cv=none; b=ZQDI47RCyzHNU+D3yn4af56XBznsiFIkrV0D5VE2zNdbFk84xOSLngHGa3IUNwdGS7fSNhqmF+rPF93VP+MCZile0qWfqs/okNU0ab/qRtywg8KXwi4LPtLVwZC9m/DqfbJNmswBzfwlVd1BKzEnJx9ecqudgMcTMH7ycE73qkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764134850; c=relaxed/simple;
	bh=u+OEtCVo5fc0/nnKXJd1ZnK5f8x1zXGtkt3vOAYONM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EX5ccYPTLZSpT6eOSWCmLc0NqaknnAHvMb7NZkk+8ZcNcZYBW9uIFkfu6UkLsvziHrkKQObkq8LotuhHgFMyZLXi2Vhs4jycN6Dwz5PHaGt6ljbs5n+MWiT+rYf319PXdQLuxi/G1aB8X43Be8B5InCjGldgk5jK6fjdNDLrflQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBBtoQbF; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBBtoQbF"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-656b4881f55so2767381eaf.2
        for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 21:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764134848; x=1764739648; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSMFqWzLWfdGgOTWHTx6nMiUCmlOuWGDKob29IPDfLw=;
        b=CBBtoQbFT0XoeIau8r4k5rtPgVPMz0fMPex63kWRB7ULZSWblEb8yWoDxjew5U7iuo
         pRfejw9rF4NbYFJXFewbwatZhB17DAy+pVq/cds5BJsTxi35qVcrCbFNegIW7W0uSS3X
         9a38AAK1u2wbveTFkIkUEibOg78W/vgf/C6rOPO8SbQT4y2pVGTIRaPjoYkB4P3nqVq7
         8VfFaN61dpfRITBManJX1UJ0xuhv0vFZHVqEBeahbnDfu1eqHDBuX4CKQzPHOgsc2ndx
         3WLy8a0B1Bh1HfuAkhp4NdemW+a5EhKJKVyhigyrxwHYoBORi9VLzUAVbFfQhH8Ltwd8
         hAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764134848; x=1764739648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pSMFqWzLWfdGgOTWHTx6nMiUCmlOuWGDKob29IPDfLw=;
        b=R2VKmf5eoseJ/lyj76WRlAajnuT7+Um5oj6xQtOmZe73QmPeB7OEFH3HeFvf6RHXGH
         KfxiBivbhCsthsfHbNuuC9yhwcNsS9cbC9yDm5tCq6j6wRYVCIcCfSelOpCgWBEuq3oH
         oBgkaI+XxIsbBnwkaMCfRqK9MLE5bHk6XTldSk7t73gxC4x23HyNVQAEQRzwZUy5FGH+
         9aMJv2Dfy2K21HuHIXaeia7aqMalLuSNS7s0TCKX86yMVXJtpzQ0yOzgbwBlTgD7wf6U
         k3p0FVBXqY+RK7nQ2ZlCGOQinSahv8GWujIBg9o9mL+TMz5wvFWtxrdJDnrRVR/PxcHI
         KvtA==
X-Forwarded-Encrypted: i=1; AJvYcCULe9bs/9m3W2PrFd0RZfOien9COG5u2KDSbhIvS0O6hnu+QWVZc8kPDlNtXWZafPBxrDr5wVfwoRA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwW7IiiYksM+p4fB0BVrw6stAsHh/1bwqhRHbczX44VcDSWmhuh
	s64xf6QSlrDu0oyXHS7f7cPxwTEx9Kndc3qQ3NXNf+agKXfTVrjkX2WO7ZL9g+t1prkxKx30USq
	JB2EUIeWXI1pA+msfLKb/9Az10FhlL+I=
X-Gm-Gg: ASbGnctlA6f1MOLoC9CArsCOwui32vnc135Fh1Gmj7NO/CrcsrNt3God9L5s0R/QlZK
	Ja6eIc7xr5ffqegecV51gtPmFrJrBLdUn4aE5Xy+xc+HQXvjxWhyarsuFMyy7coaNOGyUsfhV3c
	2ZR74vuTWw7Ee1reLETeBdrXPFt7wJd/WupdPLfICfzk0KLRMVAG0degkBUrScZ/ug/CMUluOd/
	J5mFhU7sJTyACyxdfRgW+J4oDVdxwxE1PRiCSwNLMUOdKB0cQ8ZNnoWTTilphN0Uwzi9g==
X-Google-Smtp-Source: AGHT+IHKJmnkojyeNe4AUHn94//tsVGX72UvxeyT++3i9ibL6aicyhbda/hlZTHY7k+dmC6TqvcVXS2tnrbt93vsjuk=
X-Received: by 2002:a05:6808:2111:b0:44f:6dcd:1e52 with SMTP id
 5614622812f47-4514e658837mr2441324b6e.8.1764134848040; Tue, 25 Nov 2025
 21:27:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251126023631.3143434-1-maqianga@uniontech.com>
In-Reply-To: <20251126023631.3143434-1-maqianga@uniontech.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 26 Nov 2025 13:27:17 +0800
X-Gm-Features: AWmQ_bnjLe1NR3mk-ZOY-J8E0P804F-AczLIg1c-ANabH7IUSILglpz8ICp82bw
Message-ID: <CAEyhmHTV_AkZ=hFN4aCisBbecTtOahPaMGmC8BtfD7p_9OAEJw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Correct the calculation logic of thread_count
To: Qiang Ma <maqianga@uniontech.com>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 10:37=E2=80=AFAM Qiang Ma <maqianga@uniontech.com> =
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
> index 25a87378e48e..760f5ce44384 100644
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
> +       u16 thread_count2;
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
> +       thread_count2 =3D *(u16 *)(dmi_data + SMBIOS_THREAD_PACKAGE_2_OFF=
SET);

You have `dm->length >=3D 0x30` below but the memory load already done here=
.

> +       if (thread_count !=3D 0)
> +               loongson_sysconf.cores_per_package =3D dm->length >=3D 0x=
30 && thread_count =3D=3D 0xFF ?
> +                                                    thread_count2 : thre=
ad_count;
>
>         pr_info("CpuClock =3D %llu\n", cpu_clock_freq);
>  }
> --
> 2.20.1
>
>
