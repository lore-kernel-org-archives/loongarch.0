Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F212629C
	for <loongarch@lists.linux.dev>; Sat,  4 Jan 2025 13:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735997805; cv=none; b=eEeKYAtoRIB779c9Fq6Mj4m8JrhQR5FKrq+vEOWYF4p6uSI7FrarfN4DTMi2+BD0grzZVJgFhQesZFlQ2CxJ3WIPube2+f3oNIJ8DcWMmRMabVY10j+w9CECMbGOppltfOZDOtvshKY4So59sPj4Ut/LmnIQ4nAYv99e74hWhf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735997805; c=relaxed/simple;
	bh=bJ6SvXYmPuuwI+ZbISwQhKZMISg2CpoTYVSomlHbLO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RMc0/QOnhQUmjCKourjl1PfVexM7nafvWbqBagi1kSwSFIndJTZIuqj3bbOjhwJfzBf7SiogROFI0nk0NxRgVIu4Nz7lqbGxtYfIiobRKgNxOQSzBgLuEfk71SuRLWWUJzQ18mgyO/UGSLLN2M/hgpipE4WRb7wzlvSPQESDz1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q80JNRKM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q80JNRKM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 362D9C4CEE0
	for <loongarch@lists.linux.dev>; Sat,  4 Jan 2025 13:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735997805;
	bh=bJ6SvXYmPuuwI+ZbISwQhKZMISg2CpoTYVSomlHbLO0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q80JNRKM6yLZeTIyjME1PZK74slLRP6ejhNpm3uWhOiSN1tscs/BqMNIWIwkxw0jW
	 +bryeJAKXdX/K03hPGTTSX95BEJqtbH+21JKGFwua19u2AFTXMQ4gQaSkRqITuivJf
	 MZOJmaCKzcRmF+2C5/Dn+/pTbNOyIfQPDFjSRGoHv9RJmurq4jZXWrD9EnScee6+Wl
	 NykGaE+UT9nH9fRDTRePbuIgAZsn+VNQWGBpki9p0Sqf8oCnCGDWK5bvz6qnroQEX/
	 gkB9sEoaKwGy+EYGNgL7aicBbNlX7ZewQM3T5cb+KyWq8LlD/7nu3W5gR8FlByS4s2
	 eZBA+PZRQk0PA==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso2141914166b.2
        for <loongarch@lists.linux.dev>; Sat, 04 Jan 2025 05:36:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXZXeLq+BRBpR6qLKIoJH0YnXlzj3+qwKfPI9h+6wFg7D4L14IVIcYLXg0t8eC28vKXoWM4q+hRL10=@lists.linux.dev
X-Gm-Message-State: AOJu0YycxL1+3ltgvHjwIchYarP0YVi7qx+XjYphiMr61SkEq5j4wwxu
	0d3cgJnFpEhaN5GxIs5gDMgtAuyyzPgnqI5guAAi1ihnHPKK7BjGsMI9Y3f1Y+Kgkcv2uPtPugD
	QUtygGflNLvVpHIOMuaFs1hhM0po=
X-Google-Smtp-Source: AGHT+IF0Xys93p6buCqB17ROsc/Y0yh+FGl0hJIONL/ifMRHLTa4XUc0c299M0vf3fIYvIuOLHNNlkkmgA7dI38nBeg=
X-Received: by 2002:a17:907:da6:b0:aa6:824c:4ae5 with SMTP id
 a640c23a62f3a-aac345f5cfbmr5326096166b.56.1735997803766; Sat, 04 Jan 2025
 05:36:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250103-la-misc-v2-1-fcc7c399e5e5@flygoat.com>
In-Reply-To: <20250103-la-misc-v2-1-fcc7c399e5e5@flygoat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 4 Jan 2025 21:36:31 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7qvq9_D=nYrRUVWH_PAHYo8Z5OzVEAiT8Q12hyy2rZ6A@mail.gmail.com>
X-Gm-Features: AbW1kvaNG7ww7uMsPefU4wYv2pEb3x5PFFVyI5fmSwOAO7BGpzDmdHxg--rrEYI
Message-ID: <CAAhV-H7qvq9_D=nYrRUVWH_PAHYo8Z5OzVEAiT8Q12hyy2rZ6A@mail.gmail.com>
Subject: Re: [PATCH v2] loongarch: time: Derive max_delta from prcfg1 tmrbits
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Fri, Jan 3, 2025 at 8:10=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
>
> As per arch spec, maximum timer bits is configurable and
> should not be hardcoded in any way.
>
> Probe timer bits from prcfg1 and use that to determine
> clockevent's max_delta to be conformance.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Changes in v2:
> - Move probing to cpu-probe
> - Link to v1: https://lore.kernel.org/r/20250102-la-misc-v1-1-8dc7db525e5=
4@flygoat.com
> ---
>  arch/loongarch/include/asm/cpu-info.h  | 1 +
>  arch/loongarch/include/asm/loongarch.h | 1 -
>  arch/loongarch/kernel/cpu-probe.c      | 2 ++
>  arch/loongarch/kernel/time.c           | 2 +-
>  4 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/cpu-info.h b/arch/loongarch/inclu=
de/asm/cpu-info.h
> index 900589cb159de4e5997358443c5b5e3e50f92239..fb28ba9e3011c9256da4a9748=
de97236ae7f001f 100644
> --- a/arch/loongarch/include/asm/cpu-info.h
> +++ b/arch/loongarch/include/asm/cpu-info.h
> @@ -57,6 +57,7 @@ struct cpuinfo_loongarch {
>         int                     global_id; /* physical global thread numb=
er */
>         int                     vabits; /* Virtual Address size in bits *=
/
>         int                     pabits; /* Physical Address size in bits =
*/
> +       int                     timerbits; /* Width of timer in bits */
>         unsigned int            ksave_mask; /* Usable KSave mask. */
>         unsigned int            watch_dreg_count;   /* Number data breakp=
oints */
>         unsigned int            watch_ireg_count;   /* Number instruction=
 breakpoints */
> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/incl=
ude/asm/loongarch.h
> index 64ad277e096edd7d77af6f37e234d68e571764a4..a3cc4f8d4c4a0b0521ef2b76c=
87fa57eca417d75 100644
> --- a/arch/loongarch/include/asm/loongarch.h
> +++ b/arch/loongarch/include/asm/loongarch.h
> @@ -466,7 +466,6 @@
>
>  #define LOONGARCH_CSR_TCFG             0x41    /* Timer config */
>  #define  CSR_TCFG_VAL_SHIFT            2
> -#define         CSR_TCFG_VAL_WIDTH             48
>  #define  CSR_TCFG_VAL                  (_ULCAST_(0x3fffffffffff) << CSR_=
TCFG_VAL_SHIFT)
>  #define  CSR_TCFG_PERIOD_SHIFT         1
>  #define  CSR_TCFG_PERIOD               (_ULCAST_(0x1) << CSR_TCFG_PERIOD=
_SHIFT)
> diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cp=
u-probe.c
> index cbce099037b2728b82ecb9c5aa58e05b07695c5a..06c98ddf29490571e8b927b4c=
a721c27ff7f0ea8 100644
> --- a/arch/loongarch/kernel/cpu-probe.c
> +++ b/arch/loongarch/kernel/cpu-probe.c
> @@ -192,6 +192,8 @@ static void cpu_probe_common(struct cpuinfo_loongarch=
 *c)
>         config =3D read_csr_prcfg1();
>         c->ksave_mask =3D GENMASK((config & CSR_CONF1_KSNUM) - 1, 0);
>         c->ksave_mask &=3D ~(EXC_KSAVE_MASK | PERCPU_KSAVE_MASK | KVM_KSA=
VE_MASK);
> +       c->timerbits =3D (config & CSR_CONF1_TMRBITS) >> CSR_CONF1_TMRBIT=
S_SHIFT;
> +       c->timerbits +=3D 1;
>
>         config =3D read_csr_prcfg3();
>         switch (config & CSR_CONF3_TLBTYPE) {
> diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.c
> index a07d7eff4dc5fb0f41f5fad02698ff7a84c7bc8a..ebfdab6b155585dbab08b7cc4=
9cba627a59854ec 100644
> --- a/arch/loongarch/kernel/time.c
> +++ b/arch/loongarch/kernel/time.c
> @@ -132,7 +132,7 @@ int constant_clockevent_init(void)
>  #else
>         unsigned long min_delta =3D 1000;
>  #endif
> -       unsigned long max_delta =3D (1UL << 48) - 1;
> +       unsigned long max_delta =3D CLOCKSOURCE_MASK(current_cpu_data.tim=
erbits);
>         struct clock_event_device *cd;
>         static int irq =3D 0, timer_irq_installed =3D 0;
>
>
> ---
> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> change-id: 20241223-la-misc-d610d14f947e
>
> Best regards,
> --
> Jiaxun Yang <jiaxun.yang@flygoat.com>
>
