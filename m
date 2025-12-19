Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7B9224AF1
	for <loongarch@lists.linux.dev>; Fri, 19 Dec 2025 02:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766110385; cv=none; b=kv6c0CDc997m4d02uAur0bvp2HCnR86dQ4QR7/koskoFUNP+fUp6AmOI2QRu7PbItvsVSWEPwlf0qlezkeP3BvZYLgF+yF7YA0D7vrI3aTOO01iq0XhzsSIyPLHAmTubPog/YNLQCol0QPvzS5u3Enz22l0mdm9C/12W5adNmHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766110385; c=relaxed/simple;
	bh=triT9QSniQeKLUtzo8vt39E1h9cOrKtbwvOui4gIQNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+DCW9q3r9L3S45anRa/CQ6LLLxg0P1SyrzIfmoDyeswiQSRBQ4R9ZQtOw8u33Pw+SC71hK/TsQOGxp7n5MGYn2QeCRV5oLc7q455BlF0WWml3DQttmnSL51X+CjB0dsOG996jEpr0h+PSfBSkm6LP6LRZnZelLrhIrAT+P+6K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYb2Em5K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYb2Em5K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00FBC19422
	for <loongarch@lists.linux.dev>; Fri, 19 Dec 2025 02:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766110385;
	bh=triT9QSniQeKLUtzo8vt39E1h9cOrKtbwvOui4gIQNo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cYb2Em5K4Ke5enOtxdMRo/UEGdVhx/aqBcAMPV1HiJMf3lhUP1okJuZYriqBo3ONu
	 GL+1IA3FGm+G+Uv5GCai1qi3CqHvLBLLfcwocx42jwxrSilLNiomem3/AAirB7Y2mj
	 jsdFcAwTBj90ctcxPhFwsm6GEWo0AZL95SRzGQLHvlldfhe5xJWvX9GkPGa+DFpXNa
	 5l6wbcVx5W87Qf25/jYy9z5qPukKnxmMJEMcuCwbgVO5htAYOLf7tVHlFmJDFh0EQD
	 Rs6U8VdHdrr2Jiz33ONXmv663P9AnIUn5CroLNdskWzk+5X+i9sXlrCjjZu3dIqBzi
	 53BaSe8WXZLfQ==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b73a9592fb8so260458566b.1
        for <loongarch@lists.linux.dev>; Thu, 18 Dec 2025 18:13:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdkCgKF8CLHCs1aY8bworlr2SdpE7mJb1pjheDKez3RasAcs3cRm50i/qjIpuIfnGRIN0JEiW/lEU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+ap0tpB9T/rSF2PwCfKlWPVdjTPyKW/W/ErjwZ5pVtq+oX88s
	E0lGmiGiWHnM3DBh62UhOb2UqT72F7QrVLhfm8j6rXKJ9+qerixaMMVNsKSBrVO4g/kfvikDOPG
	7M1ly8o2wUoWLt8kxywQ9iR+eo8EB/Tw=
X-Google-Smtp-Source: AGHT+IH0x7eNf3j0ubAysanhZGwFFKBdMBSuPdSso33VVXEaoaG0squlwQeXxPg9waRXjHWSnWjG/PFAV+VTiC2Kq2I=
X-Received: by 2002:a17:907:7e85:b0:b3a:8070:e269 with SMTP id
 a640c23a62f3a-b8035649310mr195334766b.14.1766110384189; Thu, 18 Dec 2025
 18:13:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251218063916.1433615-1-yuanlinyu@honor.com> <20251218063916.1433615-2-yuanlinyu@honor.com>
In-Reply-To: <20251218063916.1433615-2-yuanlinyu@honor.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 19 Dec 2025 10:13:15 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5n_3Ndk5yRm=S-9WktD9xivVF8-JLaycV8JB-pVuybbA@mail.gmail.com>
X-Gm-Features: AQt7F2qrv-imhdGopLt1MPfdTK-Ic-3FPg_HSxVXBdw9KIsFQZQLPR-6ZFBiyC4
Message-ID: <CAAhV-H5n_3Ndk5yRm=S-9WktD9xivVF8-JLaycV8JB-pVuybbA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] LoongArch: kfence: avoid use CONFIG_KFENCE_NUM_OBJECTS
To: yuan linyu <yuanlinyu@honor.com>, Enze Li <lienze@kylinos.cn>
Cc: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	WANG Xuerui <kernel@xen0n.name>, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Enze,

On Thu, Dec 18, 2025 at 2:39=E2=80=AFPM yuan linyu <yuanlinyu@honor.com> wr=
ote:
>
> use common kfence macro KFENCE_POOL_SIZE for KFENCE_AREA_SIZE definition
>
> Signed-off-by: yuan linyu <yuanlinyu@honor.com>
> ---
>  arch/loongarch/include/asm/pgtable.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/includ=
e/asm/pgtable.h
> index f41a648a3d9e..e9966c9f844f 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -10,6 +10,7 @@
>  #define _ASM_PGTABLE_H
>
>  #include <linux/compiler.h>
> +#include <linux/kfence.h>
>  #include <asm/addrspace.h>
>  #include <asm/asm.h>
>  #include <asm/page.h>
> @@ -96,7 +97,7 @@ extern unsigned long empty_zero_page[PAGE_SIZE / sizeof=
(unsigned long)];
>  #define MODULES_END    (MODULES_VADDR + SZ_256M)
>
>  #ifdef CONFIG_KFENCE
> -#define KFENCE_AREA_SIZE       (((CONFIG_KFENCE_NUM_OBJECTS + 1) * 2 + 2=
) * PAGE_SIZE)
> +#define KFENCE_AREA_SIZE       (KFENCE_POOL_SIZE + (2 * PAGE_SIZE))
Can you remember why you didn't use KFENCE_POOL_SIZE at the first place?

Huacai

>  #else
>  #define KFENCE_AREA_SIZE       0
>  #endif
> --
> 2.25.1
>
>
