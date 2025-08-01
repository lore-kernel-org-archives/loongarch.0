Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D70F154BE2
	for <loongarch@lists.linux.dev>; Fri,  1 Aug 2025 08:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754036507; cv=none; b=Yu0AtJzUPqwENSJvdIw/ZPm+qpHgBmvCQdH+1LbvFHchUPVbsjW/EJzI8SuPBzXRkaRsdSr+5aT8rOham6kccbczLvoUM6e6tHiVPEpB1opC+AyRqiy7pGARQYqWiwF4itrIovR5K5kUsawuMj9Bt72zPn/fwz9q0DnuexqJjfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754036507; c=relaxed/simple;
	bh=0LD7FbHHZb9xQxakaOrDs+bjAbb/S5etUNcsYliyllc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPL+n5DchxZjLlJqVSeDq0Y/RGgGYo/txpz9a/LZvYF0qSXLl6P7e1bXSFupcc8KmKe+sYyCkIkb2OAAhOY/tz2Vnq2XLRiAZzbzb5taGr5H2mOo2aRsQSurDJSkvP0UTQvnNZbdSAuPD70ClMMC89RG4siaDheDEUi9idDWe4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3a1nMFB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3a1nMFB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256EDC4AF09
	for <loongarch@lists.linux.dev>; Fri,  1 Aug 2025 08:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754036507;
	bh=0LD7FbHHZb9xQxakaOrDs+bjAbb/S5etUNcsYliyllc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P3a1nMFB70ZT+14hs397JVOgFZapBvCIpbwvM6YiJcy03BBquG8NOFAS1Tc8MvqZa
	 XBNNKNMYQNr3sNfVNqeO+rJBidOm+ewzToz+La1uj7hMx2tmwtt+ewQs5W4ARZEuAg
	 8sWEqtyIPi+ggG1+vnAOJmp6mQ/5EINZqxloAqfUacrVRn+0YBKLn7sGtWRseV7GSw
	 WELydDTWKJ06o0oP6YNPzTLHqRMDtuNIolNlASVyH7WYRDy7W6mftctq+53GPYE7qT
	 FdllP7zdIM9yZQmxS4OEUgyUQEulRpYXU6SKawA6rlD2upk2u7RyqDkd6baTm3cCZR
	 50E4oK+gjz86Q==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so2528790a12.2
        for <loongarch@lists.linux.dev>; Fri, 01 Aug 2025 01:21:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9vh6N6QlcG39yKYHHay5k6/AVa7wehRrxgNMfH+pMI2g/1QwIA6Ul11cBxM8pLH7irSPRNoR6b8M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpdgFUcyb8UO4mOhRE3Gw3O+ya2o1ecWLeiYm1l6K45nEPxFhr
	oBQMdvszAHBFQSM14Wzs+9YYFzOEduHag0y8gNq3/o1zvU3ZZuodAHjCyTsHpNJPIv2lNO5AmDw
	pF6z4KUjlXQWjYk8Zo6eUgnmwjXnnaw4=
X-Google-Smtp-Source: AGHT+IHXQ/MJWhzD+pxvxcgCE4goXgfdB1xy0O+a43GJnu4+3QQB1P0RvV1TxzpGCb5XWOSq7QLPEFN8O2OwKY956VM=
X-Received: by 2002:a05:6402:4402:b0:604:bf4e:852d with SMTP id
 4fb4d7f45d1cf-615cdcfb0bamr1516435a12.12.1754036505749; Fri, 01 Aug 2025
 01:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250725103624.69247-1-siyanteng@cqsoftware.com.cn>
In-Reply-To: <20250725103624.69247-1-siyanteng@cqsoftware.com.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 1 Aug 2025 16:21:33 +0800
X-Gmail-Original-Message-ID: <CAAhV-H56Fq0pXVG_zfQ06kXzY4+fw4gVyiE4MtREMFSidZb71w@mail.gmail.com>
X-Gm-Features: Ac12FXz78Ogaa-BQfp41gPBKQ8uVQpVyjWcPjBLqpw_VoVkhO6Zi6KIqNrMfF1A
Message-ID: <CAAhV-H56Fq0pXVG_zfQ06kXzY4+fw4gVyiE4MtREMFSidZb71w@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: CSR: Complete KSave registers definition
To: Yanteng Si <siyanteng@cqsoftware.com.cn>
Cc: kernel@xen0n.name, jiaxun.yang@flygoat.com, yijun@loongson.cn, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Fri, Jul 25, 2025 at 6:41=E2=80=AFPM Yanteng Si <siyanteng@cqsoftware.co=
m.cn> wrote:
>
> According to the "LoongArch Reference Manual Volume 1: Basic
> Architecture", the KSave registers (SAVE0-SAVE15) are defined
> in section 7.4.16 "Data Save (SAVE)" and listed in Table 7-1
> "Control and Status Registers Overview". These registers occupy
> CSR addresses 0x30 to 0x3F, with 16 registers in total.
>
> This patch complete the definitions of KS9 to KS15 to match the
> architecture specification.
>
> Signed-off-by: Yanteng Si <siyanteng@cqsoftware.com.cn>
> ---
>  arch/loongarch/include/asm/loongarch.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/incl=
ude/asm/loongarch.h
> index a0994d226eff..09dfd7eb406e 100644
> --- a/arch/loongarch/include/asm/loongarch.h
> +++ b/arch/loongarch/include/asm/loongarch.h
> @@ -451,6 +451,13 @@
>  #define LOONGARCH_CSR_KS6              0x36
>  #define LOONGARCH_CSR_KS7              0x37
>  #define LOONGARCH_CSR_KS8              0x38
> +#define LOONGARCH_CSR_KS9              0x39
> +#define LOONGARCH_CSR_KS10             0x3a
> +#define LOONGARCH_CSR_KS11             0x3b
> +#define LOONGARCH_CSR_KS12             0x3c
> +#define LOONGARCH_CSR_KS13             0x3d
> +#define LOONGARCH_CSR_KS14             0x3e
> +#define LOONGARCH_CSR_KS15             0x3f
>
>  /* Exception allocated KS0, KS1 and KS2 statically */
>  #define EXCEPTION_KS0                  LOONGARCH_CSR_KS0
> --
> 2.50.1
>
>
