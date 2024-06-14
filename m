Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A8B1EA6E
	for <loongarch@lists.linux.dev>; Fri, 14 Jun 2024 02:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718331102; cv=none; b=P6+1/AX0Fwe2/M50yGWYA2q1QFfwYvYiKk15ScSb9gpingSZntOCtEb352Luv6OjE5Yjg/th/b5B6MHFuUvdhUGm+iyReqvSJtGLHqsW0WYnEqbaGx/scfNqfvUIIMhzWgHQvj6nj239WHoNRjV85VunyU9ztSMM7VRmK68zJv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718331102; c=relaxed/simple;
	bh=h1Kq8yqZKDsGduo8N4jU0RFTikCuB7CihDYoCfa9Fbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iea+ViuZaGoXbfgBgqsx6m1jZDHKSOA9b8Se5oVOEMsmal331kXMubXEozS0jMFmLFVZgK3b3ZztI5ILuEqssgamCqbikx2aIaYXgS5IH/6yNCgZXQJ9a6QPyTe1RMa+S5aGSBoW7b+HAgPan7LqZGlkDkajI64TmKF6Lc7bacs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uz8YncwJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uz8YncwJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5009CC4AF48
	for <loongarch@lists.linux.dev>; Fri, 14 Jun 2024 02:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718331102;
	bh=h1Kq8yqZKDsGduo8N4jU0RFTikCuB7CihDYoCfa9Fbg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Uz8YncwJSJqgsfB9rbUsv2LonbfBWx/ioyamJIu3iwlj3Rhqr3xYj/OLzdt3/F224
	 uOJHIS0YjRN758xJLRC8vp0S8AJubQY0WsAPwlgsrILeQHRfze3VFJtd1J3A/ZaoPW
	 I5Gc8VLkHFIdbC10Bbb0EmcQivzyutVL98epa3buF9Y7IaTFepmiAiJI2EBXzaoBRN
	 VLsScbg4ByU65RCohqZ0gjtPfXTUVJbpKMvXxj/t7+6sgniuWIQ5AW+E7vAJH+D5ys
	 IogvcSc9eX4KH5IeC61t5Hs1eFL7SvY+CN4tYftZn/KZ7KJL80sTLfPJQjBg1ZBT+1
	 5+BqpH5BJqFeA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57a5bcfb2d3so874695a12.3
        for <loongarch@lists.linux.dev>; Thu, 13 Jun 2024 19:11:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWzL0+Stf2dWbszyon1rfmummDhyF+cozAoX3pQlDMgAvOBTNDC2R1k1W5f+36kgYMYzrEMWZLcApKkDDIbk6ctp8KZnpE+eTmi
X-Gm-Message-State: AOJu0YxKZe0Z2usgDvXJuTvcusI96KKwvba9GMINwPP5s7ytdfv4UWrV
	YEkTyzjlzRFlSsUzYSAvEkpt10FV0gB95Jaunkn0GW6aRz/JvSIrgSybfWBzSzF+/M/wdm7jdAq
	mX1Z47r3E260EmYPpOm1PA2NAC5E=
X-Google-Smtp-Source: AGHT+IFuG29CnHZY4s+w0G1U047qhW5qjhtHtSffpMMPmcNafw0vwjMrL6FQX8doAmYuL1f1SJ8A/PZxUZc4GgWEZhs=
X-Received: by 2002:a50:c19a:0:b0:57a:79c2:e9d6 with SMTP id
 4fb4d7f45d1cf-57cbd6c6fe4mr975557a12.33.1718331100717; Thu, 13 Jun 2024
 19:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240613-loongarch64-sleep-v1-0-a245232af5e4@flygoat.com> <20240613-loongarch64-sleep-v1-2-a245232af5e4@flygoat.com>
In-Reply-To: <20240613-loongarch64-sleep-v1-2-a245232af5e4@flygoat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 14 Jun 2024 10:11:28 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7VKGMAH10S4sOZLkbgkUSMAYzpYt-dL83S0Vg286PsaQ@mail.gmail.com>
Message-ID: <CAAhV-H7VKGMAH10S4sOZLkbgkUSMAYzpYt-dL83S0Vg286PsaQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] LoongArch: Fix ACPI standard register based S3 support
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Jianmin Lv <lvjianmin@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jiaxun,

On Fri, Jun 14, 2024 at 12:41=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.c=
om> wrote:
>
> Most LoongArch 64 machines are using custom "SADR" ACPI extension
> to perform ACPI S3 sleep. However the standard ACPI way to perform
> sleep is to write a value to ACPI PM1/SLEEP_CTL register, and this
> is never supported properly in kernel.
Maybe our hardware is insane so we need "SADR", if so, this patch may
break real hardware. What's your opinion, Jianmin?

Huacai

>
> Fix standard S3 sleep by providing a fallback DoSuspend function
> which calls ACPI's acpi_enter_sleep_state routine when SADR is
> not provided by the firmware.
>
> Also fix suspend assembly code so that ra is set properly before
> go into sleep routine. (Previously linked address of jirl was set
> to a0, some firmware do require return address in a0 but it's
> already set with la.pcrel before).
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/loongarch/power/platform.c    | 24 ++++++++++++++++++------
>  arch/loongarch/power/suspend_asm.S |  2 +-
>  2 files changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/arch/loongarch/power/platform.c b/arch/loongarch/power/platf=
orm.c
> index 3ea8e07aa225..2aea41f8e3ff 100644
> --- a/arch/loongarch/power/platform.c
> +++ b/arch/loongarch/power/platform.c
> @@ -34,22 +34,34 @@ void enable_pci_wakeup(void)
>                 acpi_write_bit_register(ACPI_BITREG_PCIEXP_WAKE_DISABLE, =
0);
>  }
>
> +static void acpi_suspend_register_fallback(void)
> +{
> +       acpi_enter_sleep_state(ACPI_STATE_S3);
> +}
> +
>  static int __init loongson3_acpi_suspend_init(void)
>  {
>  #ifdef CONFIG_ACPI
>         acpi_status status;
>         uint64_t suspend_addr =3D 0;
>
> -       if (acpi_disabled || acpi_gbl_reduced_hardware)
> +       if (acpi_disabled)
>                 return 0;
>
> -       acpi_write_bit_register(ACPI_BITREG_SCI_ENABLE, 1);
> +       if (!acpi_sleep_state_supported(ACPI_STATE_S3))
> +               return 0;
> +
> +       if (!acpi_gbl_reduced_hardware)
> +               acpi_write_bit_register(ACPI_BITREG_SCI_ENABLE, 1);
> +
>         status =3D acpi_evaluate_integer(NULL, "\\SADR", NULL, &suspend_a=
ddr);
> -       if (ACPI_FAILURE(status) || !suspend_addr) {
> -               pr_err("ACPI S3 is not support!\n");
> -               return -1;
> +       if (!ACPI_FAILURE(status) && suspend_addr) {
> +               loongson_sysconf.suspend_addr =3D (u64)phys_to_virt(PHYSA=
DDR(suspend_addr));
> +               return 0;
>         }
> -       loongson_sysconf.suspend_addr =3D (u64)phys_to_virt(PHYSADDR(susp=
end_addr));
> +
> +       pr_info("ACPI S3 supported with hw register fallback\n");
> +       loongson_sysconf.suspend_addr =3D (u64)acpi_suspend_register_fall=
back;
>  #endif
>         return 0;
>  }
> diff --git a/arch/loongarch/power/suspend_asm.S b/arch/loongarch/power/su=
spend_asm.S
> index 6fdd74eb219b..fe08dbb73c87 100644
> --- a/arch/loongarch/power/suspend_asm.S
> +++ b/arch/loongarch/power/suspend_asm.S
> @@ -66,7 +66,7 @@ SYM_FUNC_START(loongarch_suspend_enter)
>         la.pcrel        a0, loongarch_wakeup_start
>         la.pcrel        t0, loongarch_suspend_addr
>         ld.d            t0, t0, 0
> -       jirl            a0, t0, 0 /* Call BIOS's STR sleep routine */
> +       jirl            ra, t0, 0 /* Call BIOS's STR sleep routine */
>
>         /*
>          * This is where we return upon wakeup.
>
> --
> 2.43.0
>
>
