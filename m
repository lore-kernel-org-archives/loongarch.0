Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF8A29A2
	for <loongarch@lists.linux.dev>; Sat, 11 Jan 2025 12:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736596864; cv=none; b=BQorge2sk601PyNnu4I5H3Kgx5h3Q23ND0uxMVsX3A76mn3o13e11EoLsQ2VzMHBWylXm9RhiQap+iPD/ApNMPrW7bD9S3RFZ4BJn/oD8U5CNw6CP5ikEY72QKZ3FPkbGlk0OLqDNJqi2CYv86vmQs4ohP3wlpEQHapmJfXJ3XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736596864; c=relaxed/simple;
	bh=N3H/Qf6U9DBkXOVHm4m2N8ncVlf7iF2/RCv3i3uiEH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OjO/KgTfW1HHgFt7B7QfGAgrNo9qGkykLLzfVQVlU2bnRHkONP0PnhX+MzEZkHlAmTNQSWBI/wVMSWDv7kpBO1OupZ5Hp1VKcVXc7BhUHYMDHQd4zEpvkdoyU9fBrvNtQpPyliw7mrjv6pvhemK2iLonQBWr9pCz0L/saW9vt1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qiSjWm7z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qiSjWm7z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6548FC4CED2
	for <loongarch@lists.linux.dev>; Sat, 11 Jan 2025 12:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736596864;
	bh=N3H/Qf6U9DBkXOVHm4m2N8ncVlf7iF2/RCv3i3uiEH0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qiSjWm7zgiNdsoBJxBUYpYQPQbGv+KrhhGjMSdZTmR+HWGiiUpKuGccc12bTvq0YC
	 Wvpvp9UStJKIBptIaDuGTWESGdDCXF60AjGDYuQbKDttW+aTLZDNAdWAYD0eE757yO
	 YvXofXDhN0CdsqEW4wLek6/nXJ6Awf07GswD67p4/fbhlH/7no43xlRTLjeGMuj2y1
	 8UFL75yf3svXKyQjie47DyBmNaSPGCBa2nYsXjfW9iEyeSxuHC+DFFTWPcQ0hXmyz+
	 XT/iOn+BMe67IaJd7xMUqEbZRv+lfbhoroi7L0j+60cAsrwXLYMyBHNx5inf97vBah
	 vocqI2LWBJ9dg==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso512099766b.2
        for <loongarch@lists.linux.dev>; Sat, 11 Jan 2025 04:01:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0KYk2AsEgWT8QFjIQx5L86Xf7zBMCgVsjlhWp0DaiCu+aG7bMcnVnpA2d2MQvFmXij2d4o6i8uRA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxkTUZqtfMbxXjz05iGizVOH9tHpKCHV2RihF5BR6s2bzRnQVz
	I2qP68M8dD6bGkuiuUaGGTYX0rWDH1i4Sak8ldkuELxCDVEAbH6vS7Qir8YNptXCNNlPOt6Qyzh
	hly6aROE+wq8RySHcFqMpZBeiTCM=
X-Google-Smtp-Source: AGHT+IH3QEjHLof2K5IiCoCbPqMatm697pPTpsqHwCsI3mHL0SIe+TkhucKXAzew0b/GjYRpiXrNmh2K9Bt5f7/D6L8=
X-Received: by 2002:a17:907:2d24:b0:aa6:90f1:a9bb with SMTP id
 a640c23a62f3a-ab2ab6c6738mr1377598466b.24.1736596863005; Sat, 11 Jan 2025
 04:01:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250111023704.17285-1-zhangtianyang@loongson.cn>
In-Reply-To: <20250111023704.17285-1-zhangtianyang@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 11 Jan 2025 20:00:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7o0Pwnyex-6+PSp9dGM=BgqEZc1jPDMvR272y9VqoH8Q@mail.gmail.com>
X-Gm-Features: AbW1kvaW1yy2cQVAp-cJnqCQtUX9xaBz65v_ZhIZ3sT6b4zDo8l285JKWSt7Z4o
Message-ID: <CAAhV-H7o0Pwnyex-6+PSp9dGM=BgqEZc1jPDMvR272y9VqoH8Q@mail.gmail.com>
Subject: Re: [PATCH V3] irqchip/loongarch-avec:Add multi-nodes topology support
To: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: kernel@xen0n.name, tglx@linutronix.de, loongarch@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Acked-by: Huacai Chen <chenhuacai@loongson.cn>

On Sat, Jan 11, 2025 at 10:37=E2=80=AFAM Tianyang Zhang
<zhangtianyang@loongson.cn> wrote:
>
> avecintc_init() enables the Advanced Interrupt Controller (AVEC) of
> the boot CPU node, but nothing enables the AVEC on secondary nodes.
>
> Move the enablement to the CPU hotplug callback so that secondary
> nodes get the AVEC enabled too. In theory enabling it once per node
> would be sufficient, but redundant enabling does no hard, so keep the
> code simple and do it unconditionally.
>
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> ---
>  drivers/irqchip/irq-loongarch-avec.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-l=
oongarch-avec.c
> index 0f6e465dd309..80e55955a29f 100644
> --- a/drivers/irqchip/irq-loongarch-avec.c
> +++ b/drivers/irqchip/irq-loongarch-avec.c
> @@ -56,6 +56,15 @@ struct avecintc_data {
>         unsigned int            moving;
>  };
>
> +static inline void avecintc_enable(void)
> +{
> +       u64 value;
> +
> +       value =3D iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
> +       value |=3D IOCSR_MISC_FUNC_AVEC_EN;
> +       iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
> +}
> +
>  static inline void avecintc_ack_irq(struct irq_data *d)
>  {
>  }
> @@ -127,6 +136,8 @@ static int avecintc_cpu_online(unsigned int cpu)
>
>         guard(raw_spinlock)(&loongarch_avec.lock);
>
> +       avecintc_enable();
> +
>         irq_matrix_online(loongarch_avec.vector_matrix);
>
>         pending_list_init(cpu);
> @@ -339,7 +350,6 @@ static int __init irq_matrix_init(void)
>  static int __init avecintc_init(struct irq_domain *parent)
>  {
>         int ret, parent_irq;
> -       unsigned long value;
>
>         raw_spin_lock_init(&loongarch_avec.lock);
>
> @@ -378,9 +388,7 @@ static int __init avecintc_init(struct irq_domain *pa=
rent)
>                                   "irqchip/loongarch/avecintc:starting",
>                                   avecintc_cpu_online, avecintc_cpu_offli=
ne);
>  #endif
> -       value =3D iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
> -       value |=3D IOCSR_MISC_FUNC_AVEC_EN;
> -       iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
> +       avecintc_enable();
>
>         return ret;
>
> --
> 2.20.1
>
>
