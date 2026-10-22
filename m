Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792654636;
	b=yBy3U/b/3qH7vTHz6+tuCL3cpIrH7zrTtWoLOBTP4w5l7AzJS1rUIpJWZbfQpxo9SwQ3
	 zXLyuAfTzEvsE3KGw5sb1KWBQkM8Jsv5nCg1uEIHRQXCWVplz+FHAJOq2FKyRK/uY65dQ
	 FAHyxg9MdGw37bt1EXAtfp5g8vWilsNhYyFGOws0mU798WumWQ8MZGClG0nW6uIvYuPc5
	 AX3gRsCQT6jowd42dSbxfPuKGsSDdMFf9eX69KEElM3t10Kr25y5KqOZ7qK1Jy1/PtGCr
	 kde1vWQ9FpW0Si9WlwjY+ShDJdtJjJCjavILEVWxWzkSF2fdy7A9zdfPv/ntrn+TDZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654636;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/9fEXjgWK+5EHi3FibFeHP1l+KFsWv8kl3bq+SGJzBY=;
	b=ekxosvUEZcmsRzxwZUajOSUZOA0t+2D36NMFxuwf/aUcWNZ2s9rBb/aEJxA23g5uyW7k
	 5xz36KhP7uzye2LG2/vQo1OHdg0JRdEnQoJyLDxAGX4h1+lXlEP7pW9lPuTBU3cct3hb1
	 m9DmdebozSyTrY/MjgIFCEVWm/rlzhwSWq95iqLKQjPPUrkod/QtNCn1PBLxQ7KyPFSK3
	 RaDf3dWfDeVrADyoCemKMlZuNZdozo+DM0v+QgyHyOqUr8tO2WJtJ5/aLZpYZAlEp4G1G
	 KYJ0Au5noSL+j8w/K4kEDpqpyoRKMU5RaL2Xj6NJqiuJ7LsX9pdZYBpG8SDaAMlQ4qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JQwZvaCV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D00606A324
	for <loongarch@lists.linux.dev>; Thu, 22 Oct 2026 07:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JQwZvaCV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14AD61F000C8
	for <loongarch@lists.linux.dev>; Thu, 22 Oct 2026 07:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792654636;
	bh=/9fEXjgWK+5EHi3FibFeHP1l+KFsWv8kl3bq+SGJzBY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JQwZvaCVhjDioasnofk93mEz6Hxtkx7HIlMtDOal7shCM4Hw4d2yhVoofG3xNag0q
	 X7m0x19DFiGD+cMb5nMjmLEka6nHcwV2FGlgC+MOGqpOGK/u1LWVnkdp2NvDBfF5so
	 ZR6lN88qCo0I7eFCsmoQWIB/3CqQdlSLpWhqJEnPGoPnNPgwLROkUqG6zTzAUGe13i
	 +MomN8iyCsljSThsqqfeqYGBVNFpKTMjZpoENfgMRKzyLi9bCax1zfiUgpp3SuxvF8
	 nMFkNkGhZtNVnhy/HKW2W6/pjFI3BXnRINMZRBfTUy/2NS8MPpmNO7Fh8vd8np4BjP
	 jPmVEYq+Ro+UA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso2124130a12.2
        for <loongarch@lists.linux.dev>; Thu, 22 Oct 2026 00:37:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw0iei3gixZiz9LLSoVwFabOSVKfK/36JJsFXiOdOKZbkoEHD0OjbxGT1igN4uMWNMeOgZxhbMf+Xs=@lists.linux.dev
X-Gm-Message-State: AFq9FYK1Qm48+KxC4jYNWYMbV0Luq37Izph4Vm+mf/o6rEBKzNswLWlR
	nnLhxsPfFP1xkZdml89/u4iQuhPe5IHBaBMMci+QLQHQdDg1ZXrIh+rv6qOpNdN4WJs9xlx46lD
	4m64IsgY7D12be4N0llji0LUY40yF+mo=
X-Received: by 2002:a05:6402:4489:b0:6b1:c7ae:ec40 with SMTP id
 4fb4d7f45d1cf-6b408e06542mr3630391a12.4.1792654634648; Thu, 22 Oct 2026
 00:37:14 -0700 (PDT)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021144524.364143-1-yaojiale02@163.com> <20261021144524.364143-6-yaojiale02@163.com>
In-Reply-To: <20261021144524.364143-6-yaojiale02@163.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 22 Oct 2026 15:37:01 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4vM=2QP++udx9ZrRSqszKxqFtk_44v6wozTzXhof5e+g@mail.gmail.com>
X-Gm-Features: AclHuK_AJuJIsK7gC6j48HUSTFZkH-rDHhLYzk2zC8jiWYZT2RAg3ZFTnsvOLaM
Message-ID: <CAAhV-H4vM=2QP++udx9ZrRSqszKxqFtk_44v6wozTzXhof5e+g@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] irqchip/loongarch-cpu: validate MADT LIO-PIC entries
To: Jiale Yao <yaojiale02@163.com>
Cc: WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Jianmin Lv <lvjianmin@loongson.cn>, Marc Zyngier <maz@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jiale,

On Wed, Oct 21, 2026 at 10:45=E2=80=AFPM Jiale Yao <yaojiale02@163.com> wro=
te:
>
> The LIO-PIC MADT callback passes a typed record to the controller
> initialization code without checking that the complete record is
> present. A truncated firmware entry can therefore lead to out-of-bounds
> field reads.
>
> Reject incomplete LIO-PIC entries before passing them to the
> initialization helper.
>
> Fixes: b2d3e3354e2a ("irqchip: Add LoongArch CPU interrupt controller sup=
port")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/irqchip/irq-loongarch-cpu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/irqchip/irq-loongarch-cpu.c b/drivers/irqchip/irq-lo=
ongarch-cpu.c
> index 84ce24889488..6185825477f4 100644
> --- a/drivers/irqchip/irq-loongarch-cpu.c
> +++ b/drivers/irqchip/irq-loongarch-cpu.c
> @@ -119,6 +119,9 @@ static int __init liointc_parse_madt(union acpi_subta=
ble_headers *header,
>  {
>         struct acpi_madt_lio_pic *liointc_entry =3D (struct acpi_madt_lio=
_pic *)header;
>
> +       if (BAD_MADT_ENTRY(liointc_entry, end))
> +               return -EINVAL;
If the madt entry is invalid, the control flow probably cannot arrive
here. On the other hand, All loongson-specific drivers, such as
irq-loongarch-cpu.c, irq-loongarch-avec.c, irq-loongarch-ir.c,
irq-loongson-liointc.c, irq-loongson-eiointc.c, irq-loongson-htvec.c,
irq-loongson-pch-pic.c, use the same logic. Why is this one special?

Huacai
> +
>         return liointc_acpi_init(irq_domain, liointc_entry);
>  }
>
> --
> 2.34.1
>
