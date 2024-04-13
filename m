Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464CC1CD29
	for <loongarch@lists.linux.dev>; Sat, 13 Apr 2024 07:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712992984; cv=none; b=sPEMxaEsKJ0VPZMPVdvZAo8NKGyV8YhYj8xBkgyFTmoDRw2fdKnRqXRc/0vKuFRS4UK4gBScnpJQbtzYJ1zZPUHIlqo5gGxcaTNz0lJ06V+XYoX/RijgXG/KW/kpuIhKR5kpWU9r7OyCkHmEl3xVuAvYBDT+AcPabIVko5dPhk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712992984; c=relaxed/simple;
	bh=znindURu6syxZCUdsq8eyAEHNwtlxVuyxxFUU01AXRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oIiYIORgxLMmZNrjqfrfGtBMDMwst9pIailzbdrurToYWUUzAq7AcKEC68aFdb4ER7linz2w9tZ0Be3x+F1jZi6N5XtzyjwzlotVen3UKRsuWqiIZofMmdHzE9FREBdXD9j5+5Sy3zrJyEYsisaYir4XTyzh5A8WlHN19uxJEBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEvH0nFM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEvH0nFM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BA3C113CE
	for <loongarch@lists.linux.dev>; Sat, 13 Apr 2024 07:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712992983;
	bh=znindURu6syxZCUdsq8eyAEHNwtlxVuyxxFUU01AXRI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cEvH0nFMj82rLcW0g+EaGqs+Ywk24AARcz5yrMVUvGp+X7Dz9ad9vg4KhqSbWmgX7
	 PZ//M3D4RzthZq/MXTUF7XMZwbSD/ijUPod1a90s7N9lPBDZ0xGWGmeDme9ngEGZfy
	 iXlHSi4268+e9Hy8HZkaRAbyF1BCUj1NAmvonGeeQg4Bjm62H/EDtjaGxjRPeEqh6W
	 ygvWz/JivtxkcS2hmxdsIloiI4ohsQgAF271dIxOYDDsZKa7FyXIZJK5cFX4r/r1fi
	 CzYS7qM7DZY2AZFKPRo2dnRQj5pg/pJ7K+MPMe1GkDLR/q7fzFf9u6tsKsulHO0Dt4
	 dpKadZKyA5G1w==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a51d05c50b2so184075766b.0
        for <loongarch@lists.linux.dev>; Sat, 13 Apr 2024 00:23:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/g17gVUlmsrkBU9Zx7WD7VYf0vqmRef938vaLR25/n79+XX1pzh3sqUoy/I8lhzFnZH+Ecqo+qAVWJRkEVbaLhcARzA9HmdDF
X-Gm-Message-State: AOJu0YwJnGTu3viMYG9LxcDnbM441agMyzft44X24KctDduWAowS1/Fa
	r503aq2vUETAz1p0fXw987UOEaYlqi7Uv4gS6AwFa4BF/58KVoBoyxhhGhxN5HoPDIvuUv/SzaD
	h1pLWlV65CtlHjtFpCYzSoaf9Pjc=
X-Google-Smtp-Source: AGHT+IHdJVtSEWP6tIaEGd/ab2xpoBn77/eGh8rrTHUF/9oTUczygW1LkyjhHmlfjy2r43UXtZslrURKwoBDkkHLm+Y=
X-Received: by 2002:a17:907:2d2b:b0:a52:2d3a:825c with SMTP id
 gs43-20020a1709072d2b00b00a522d3a825cmr4508584ejc.68.1712992982471; Sat, 13
 Apr 2024 00:23:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240411010510.22135-1-yangtiezhu@loongson.cn>
 <20240411010510.22135-4-yangtiezhu@loongson.cn> <CAAhV-H7SqudMeyK6_+j0ah=N=ywsv=4kk_b=hxocEQFsKZ+0bA@mail.gmail.com>
 <9b95e6d7-35d2-eeee-f6dc-fc7741a48b62@loongson.cn>
In-Reply-To: <9b95e6d7-35d2-eeee-f6dc-fc7741a48b62@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 13 Apr 2024 15:22:55 +0800
X-Gmail-Original-Message-ID: <CAAhV-H43_Ue4j=DspyJT+qcKbLnWE3Qch_nUGiTRNBYdhR3qpA@mail.gmail.com>
Message-ID: <CAAhV-H43_Ue4j=DspyJT+qcKbLnWE3Qch_nUGiTRNBYdhR3qpA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] LoongArch: Save and restore PERCPU_BASE_KS for
 ACPI S3 state
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 5:30=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
>
>
> On 04/12/2024 12:18 PM, Huacai Chen wrote:
> > Hi, Tiezhu,
> >
> > On Thu, Apr 11, 2024 at 9:05=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> >>
> >> Currently, per_cpu_offset(x) is defined as __per_cpu_offset[x])
> >> only under CONFIG_SMP in include/asm-generic/percpu.h, that is
> >> to say, the implementation of loongarch_common_resume() which
> >> calls per_cpu_offset(0) is not suitable for the case of non-SMP,
> >> so do not write per_cpu_offset(0) to PERCPU_BASE_KS when resume,
> >> just save the value of PERCPU_BASE_KS when suspend and restore
> >> it when resume to make it work well for both SMP and non-SMP.
> > For non-SMP you need PERCPU_BASE_KS to do what?
>
> The initial aim is to avoid build error under !CONFIG_SMP
> and it works well on both !CONFIG_SMP and CONFIG_SMP, the
> changes are similar with the code in hibernate.c.
>
> An alternative way is to do the following simple change,
> but it seems a little ugly due to the ifdef, let me know
> what is your preference.
Add "u64 pcpu_base" at the last of saved_registers is better than this
patch, and can avoid ifdef.

Huacai

>
> diff --git a/arch/loongarch/power/suspend.c b/arch/loongarch/power/suspen=
d.c
> index 166d9e06a64b..35191afefcda 100644
> --- a/arch/loongarch/power/suspend.c
> +++ b/arch/loongarch/power/suspend.c
> @@ -44,7 +44,9 @@ void loongarch_common_resume(void)
>   {
>          sync_counter();
>          local_flush_tlb_all();
> +#ifdef
>          csr_write64(per_cpu_offset(0), PERCPU_BASE_KS);
> +#endif
>          csr_write64(eentry, LOONGARCH_CSR_EENTRY);
>          csr_write64(eentry, LOONGARCH_CSR_MERRENTRY);
>          csr_write64(tlbrentry, LOONGARCH_CSR_TLBRENTRY);
>
> Thanks,
> Tiezhu
>
>
