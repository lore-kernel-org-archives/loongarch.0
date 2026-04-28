Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706B243E9FB
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380422; cv=none; b=EDh9QPCSOadULrhN7hKsqSaFPJF8mbms91VWhSpqyIwIR0kSi1aypA8QsW6pQW9DWxFX7VTayfmAmNtvaGPRJzMFz3Z30kKwCXo/bM3AZfeB5uRZGKhb3xfmANpFSaz/v7GufgmsIW/9+Z1qcPt9OhrTDfjs4j+HxTPSm1jvTkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380422; c=relaxed/simple;
	bh=XsB86+Kx+77VEmjeJdHR4Hwf+22zPEnXRNgsMnUkScY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q32PsMMe3nJ65EmA0PNBtWDhXX6w6UzVNH6lBSsNg3rjzlO2oGz6/79N368X4V/vJmvjvuPrUn4gxaV4v32osv50kFOss0CspRSh+WKs88ZVYUvkB39OANyrb9SdVSSe32azcaC3BfNxLQ8ViXAR8hN4jqmid/CxNCkYatwOtlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFuqyuIm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFuqyuIm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DD9C4AF09
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 12:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777380421;
	bh=XsB86+Kx+77VEmjeJdHR4Hwf+22zPEnXRNgsMnUkScY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NFuqyuImGrhijMTVsmwREc+F4nov9rVKj9IMoVCUHTsON+8vlEI8Wx/PiOFBbFKWB
	 V6B4O9UJN/u3p2iTPdtzBM0n6elSfnuLDYp4YvctpLF+Bi+bkh8Z1pCB/AS5JQrp/q
	 0iarBo6V9RzayuWjl26BONJ5OLuAQCXHcvhEysTHAbBMK++PBX73qra8uZDH+11cQ9
	 Nz4RwFE5O2irGqjPtH5yhwUK7VCrYndJ9uMHzrRWqAtHeS76IKELYdKhiczPb7IeAz
	 i4EvfWvowlJunrG1qTkkr61rF5QkIfcvIoqdmgfE/wRpRAV+DAhfZN0ZGlJ9q7T56c
	 aVspTd10RSo/Q==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9c603ec2dfso1448579566b.1
        for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 05:47:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/UsAvEwQTRgTKgKPNsB2zbE452LIabqcj7bqDJNbvgcDq8y4LuOA+zoKhnJ3crox8+FGwTY9zBmeU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfjGhQKEjnNBXc43zV3Z0LHkme4AqwE2DOXgZ9THoHlYsooKaR
	zR0KS8uHjOpaKjmB/AHiMa0AjteK34BSlCLwsyYnde8Ii4jfKhMYywb7cW813SSYHd5Lmh9syed
	UxvexjhHO9BQPsm54kEfTkutF0wC5zRQ=
X-Received: by 2002:a17:907:3e0c:b0:ba7:ade5:8605 with SMTP id
 a640c23a62f3a-bb801dd931emr186375366b.6.1777380420214; Tue, 28 Apr 2026
 05:47:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428123510.314073-1-maqianga@uniontech.com>
In-Reply-To: <20260428123510.314073-1-maqianga@uniontech.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 28 Apr 2026 20:47:13 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5O-V73k10h6d_w=QhKHDPJBXOuCkpDESTEechHEsa6Yg@mail.gmail.com>
X-Gm-Features: AVHnY4I3Bsf2I7uvlVfcPZUmKwtXD328lYOBOh8O2d91wHfZkZTX0jlPQcZE51U
Message-ID: <CAAhV-H5O-V73k10h6d_w=QhKHDPJBXOuCkpDESTEechHEsa6Yg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Correct the definitions related to CSR_CPUID_COREID{_WIDTH}
To: Qiang Ma <maqianga@uniontech.com>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you do some investigation about the history before coding?
9559d5806319a9254d9053b22a31324e1929aac ("LoongArch: Increase max
supported CPUs up to 2048")

Huacai

On Tue, Apr 28, 2026 at 8:36=E2=80=AFPM Qiang Ma <maqianga@uniontech.com> w=
rote:
>
> The valid bits of CPU Identity (CPUID) are 0 to 8
> according to LoongArch Reference Manual, so change
> 11 to 9 for the related code.
>
> Link: https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-E=
N.html#cpu-identity
>
> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> ---
>  arch/loongarch/include/asm/loongarch.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/incl=
ude/asm/loongarch.h
> index 2a6bc99177d8..bc47df90fee6 100644
> --- a/arch/loongarch/include/asm/loongarch.h
> +++ b/arch/loongarch/include/asm/loongarch.h
> @@ -429,8 +429,8 @@
>
>  /* Config CSR registers */
>  #define LOONGARCH_CSR_CPUID            0x20    /* CPU core id */
> -#define  CSR_CPUID_COREID_WIDTH                11
> -#define  CSR_CPUID_COREID              _ULCAST_(0x7ff)
> +#define  CSR_CPUID_COREID_WIDTH                9
> +#define  CSR_CPUID_COREID              _ULCAST_(0x1ff)
>
>  #define LOONGARCH_CSR_PRCFG1           0x21    /* Config1 */
>  #define  CSR_CONF1_VSMAX_SHIFT         12
> --
> 2.20.1
>
